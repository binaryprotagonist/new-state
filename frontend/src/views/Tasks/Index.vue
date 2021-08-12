<template>
    <v-container>
        <v-tabs fixed-tabs v-model="tab">
            <v-tab  v-if="
                                        $auth.check([
                                            'Administracio'
                                        ])
                                    ">Pendents</v-tab>
            <v-tab>Assignades</v-tab>
            <v-tab  v-if="
                                        $auth.check([
                                            'Administracio'
                                        ])
                                    ">Completades</v-tab>
        </v-tabs>
        <v-skeleton-loader
            :loading="isViewLoading"
            transition="scale"
            group
            height="420"
            type="table"
        >
            <v-card>
                <v-toolbar>
                    <v-toolbar-title>Tàsques </v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud tasks')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    medium
                                    small
                                    fab
                                    class="mr-2"
                                    dark
                                    v-on="on"
                                    color="primary"
                                >
                                    <v-icon dark>add</v-icon>
                                </v-btn>
                            </template>
                            <Modal
                                v-if="dialog"
                                :editedItem="editedItem"
                                :patients="patients"
                                :services="services"
                                @save="save"
                                @close="close"
                            ></Modal>
                        </v-dialog>
                        <v-dialog
                            v-model="workerDialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <AssignWorkerModal
                                :editedItem="editedItem"
                                :workers="workers"
                                @close="close"
                                @save="saveWorker"
                            ></AssignWorkerModal>
                        </v-dialog>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    @click="deleteMultiple"
                                    v-on="on"
                                    small
                                    fab
                                    color="error"
                                >
                                    <v-icon dark>delete_sweep</v-icon>
                                </v-btn>
                            </template>
                            <span>Borrar Multiples</span>
                        </v-tooltip>

                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="activeItems"
                        :search="search"
                        show-select
                        v-model="selected"
                        :rowsPerPageItems="rowsPerPage"
                        ref="content"
                    >
                        <v-progress-linear
                            slot="progress"
                            color="blue darken-4"
                            indeterminate
                        ></v-progress-linear>
                        <template v-slot:item.picture="{ item }">
                            <v-avatar class="profile">
                                <v-img :src="item.picture"></v-img>
                            </v-avatar>
                        </template>
                        <template
                            v-if="workers.length >= 1"
                            v-slot:worker="{ item }"
                        >
                            <v-chip
                                :key="worker.id + item.id"
                                v-for="worker in item.workers"
                                color="primary"
                                small
                            >
                                {{ worker.name }} {{ worker.last_name }}
                            </v-chip>

                            <v-chip
                                v-if="workers.length <= 0"
                                color="error"
                                small
                            >
                                No assignada
                            </v-chip>
                        </template>
                        <template v-slot:item.action="{ item }">
                            <template v-if="$auth.check('crud tasks')">
                                <v-icon  v-if="$auth.user().role != 'Referent social'"
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                    >edit</v-icon
                                >
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="
                                        $router.push({
                                            name: 'tasks_show',
                                            params: { id: item.id }
                                        })
                                    "
                                    >remove_red_eye</v-icon
                                >
                                <v-icon
                                    v-if="
                                        $auth.check([
                                            'Administracio'
                                        ])
                                    "
                                    small
                                    class="mr-2"
                                    @click="assignWorker(item)"
                                    >assignment_ind</v-icon
                                >

                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="isFinishTask(item)"
                                    >task</v-icon
                                >
                            </template>
                             <template>
                                 <a
                                    target="_blank"
                                    :href="`/tasks/${item.id}/invoice`"
                                >
                                    <v-icon class="mr-2" small>
                                        download
                                    </v-icon>
                                </a>
                                <a
                                    target="_blank"
                                    :href="`/tasks/${item.id}/invoice/excel`"
                                >
                                    <v-icon class="mr-2" small>
                                        download
                                    </v-icon>
                                </a>
                             </template>
                        </template>
                    </v-data-table>
                </v-card-text>
            </v-card>
        </v-skeleton-loader>
        <br>
        <v-card>
            <FullCalendar  light :events="events" :config="config"></FullCalendar>
        </v-card>
    </v-container>
    
</template>
<script>
import Modal from "./Modal";
import 'fullcalendar/dist/fullcalendar.css'
import 'fullcalendar/dist/locale/es'
import AssignWorkerModal from "./AssignWorkerModal";
import { FullCalendar } from 'vue-full-calendar'
export default {
    components: {
        Modal,
        AssignWorkerModal,
        FullCalendar
    },
    data() {
        return {
            tab: 0,
            headers: [
                {
                    text: "Usuari",
                    value: "patient.full_name"
                },
                {
                    text: "Inici",
                    value: "start_date"
                },
                {
                    text: "Finalització",
                    value: "end_date"
                },
                {
                    text: "Treballador",
                    value: "worker"
                },
                {
                    text: "Tipus de visita",
                    value: "visit_type"
                },
                {
                    text: "Descripció",
                    value: "description"
                },
                {
                    text: "Creat",
                    value: "created_at"
                },
                {
                    text: "Accions",
                    value: "action",
                    sortable: false,
                    filtrable: false
                }
            ],
            selected: [],
            search: null,
            dialog: false,
            editedIndex: -1,
            items: [],
            patients: [],
            workers: [],
            workerDialog: false,
            editedItem: {},
                events: [],
                config: {
                  weekends: true,
                   locale: 'ca'
                },
                color: '#b95e5e',   // an option!
                textColor: '#b95e5e',
                backgroundColor : '#b95e5e',
                services : []
        }
    },
    created() {
        this.initialize();
    },
    computed: {
        activeItems() {
            return this.items.filter(x => x.status == this.status).length > 0
                ? this.items.filter(x => x.status == this.status)
                : [];
        },
        // eslint-disable-next-line
        status() {
            if (this.tab == 0) {
                return "pendents";
            } else if (this.tab == 1) {
                return "asignades";
            } else if (this.tab == 2) {
                return "completades";
            }
        }
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/services").then(resp => {
               this.services = resp.data;
            });
            this.axios.get("/tasks").then(resp => {
                let tempEvent = [];
                resp.data.map(function(item,index){
                    console.log(item.task_s)
                    let cT = new Date();
                    let gT = new Date(item.task_e);
                    console.log(item.task_s + '-'+ item.task_e);
                    if (cT.getTime() >= gT.getTime())
                        tempEvent.push({title:item.description,start:item.task_s,end:item.task_e,eventClassNames:['shiv']});
                });
                this.events = tempEvent;
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
                let months = document.getElementsByClassName('fc-agendaWeek-button');
                for (var i = 0; i < months.length; i++) {
                months[i].innerHTML = "Setmana";
                }
                let days = document.getElementsByClassName('fc-today-button');
                for (var i = 0; i < days.length; i++) {
                days[i].innerHTML = "avui";
                }
            });
            this.axios.get("/patients").then(resp => {
                this.patients = resp.data;
            });
            this.axios.get("/workers").then(resp => {
                this.workers = resp.data;
            });
        },

        close() {
            this.dialog = false;
            this.workerDialog = false;
            this.editedIndex = -1;
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.dialog = true;
        },
        assignWorker(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.workerDialog = true;
        },
        saveWorker() {
            this.axios
                .post(`/tasks/${this.editedItem.id}/worker`, this.editedItem)
                .then(resp => {
                    Object.assign(this.items[this.editedIndex], resp.data);
                    this.close();
                })
                .catch(() => {
                    this.close();
                });
        },
        async save() {
            this.$set(this.editedItem, "loading", true);
            this.$set(this.editedItem, "type", this.type);
            if (this.editedIndex > -1) {
                this.axios
                    .put(`/tasks/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.initialize();
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/tasks", this.editedItem)
                    .then(resp => {
                        this.items.push(resp.data);
                        this.initialize();
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            }
        },
         isFinishTask(item) {
            this.$set(this.editedItem, "loading", true);
            const index = this.items.indexOf(item);
            if (
                confirm(
                    `¿Estás segura de hacer que el estado termine? ${item.name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .post(`/tasks/finish/${item.id}`)
                    .then(() => {
                        this.initialize();
                    })
                    .catch(() => {
                        alert("¿No puede actualizar la tarea?");
                    });
                // });
            }
        },
        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (
                confirm(
                    `Estás seguro de que deseas eliminar este proveidor? ${item.name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/tasks/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No se puede eliminar el proveidor");
                    });
                // });
            }
        },
        async toggleStatusMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Elije al menos uno",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                await this.axios.post(`tasks/${item.id}/toggle`);
                item.active = !item.active;
            }

            this.$store.commit("showSnackbar", {
                text: "Realizado con excito",
                color: "success"
            });
        },
        async deleteMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Elije al menos uno",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                await this.deleteItem(item);
            }

            this.$store.commit("showSnackbar", {
                text: "Realizado con excito",
                color: "success"
            });
        }
    }
};
</script>

<style>
   
   .fc-v-event.fc-not-end:hover {
        background: #e2e2e2;
        color: #000;
    }

    .fc-v-event.fc-not-end {
        font-size: 12px;
        font-weight: 300;
        background: #fff;
        display: inline-block;
    }

    .v-application a {
        color: #ffffff !important;
    }

    a.fc-day-grid-event {
        color: #fff !important;
    }

        div#calendar {
        padding: 16px;
        }

        .fc-unthemed .fc-content, .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td, .fc-unthemed .fc-list-view, .fc-unthemed .fc-popover, .fc-unthemed .fc-row, .fc-unthemed tbody, .fc-unthemed td, .fc-unthemed th, .fc-unthemed thead {
        border-color: hsla(0,0%,100%,.12);
        }

        .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td, .fc-unthemed .fc-popover .fc-header {
        background: hsl(0deg 0% 35%);
        }

        .event-red {
            background :red;
            border-color : red;
        }

        .event-green {
            background :green;
            border-color : green;
        }

        .event-yellow {
            background :yellow;
            border-color : yellow;
        }

        .event-pink {
            background :pink;
            border-color : pink;
        }

        .event-blue {
            background :blue;
            border-color : blue;
        }

</style>
