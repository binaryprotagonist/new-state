<template>
    <v-container>
        <v-skeleton-loader
            :loading="isViewLoading"
            transition="scale"
            group
            height="420"
            type="table"
        >
            <v-card>
                <v-toolbar>
                    <v-toolbar-title>Treballadors</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud workers')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn small fab dark v-on="on" color="primary">
                                    <v-icon dark>add</v-icon>
                                </v-btn>
                            </template>
                            <Modal
                                v-if="dialog"
                                :editedItem="editedItem"
                                @save="save"
                                :roles="roles"
                                @close="close"
                            ></Modal>
                        </v-dialog>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    v-on="on"
                                    @click="toggleStatusMultiple"
                                    small
                                    class="mx-3"
                                    fab
                                    color="secondary"
                                >
                                    <v-icon dark>cached</v-icon>
                                </v-btn>
                            </template>
                            <span>Activar/Desactivar</span>
                        </v-tooltip>
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
                    <template>
                          <v-dialog
                            v-model="excelDialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                                <v-card>
                                    <v-card-title>
                                        <span class="headline">
                                            Hores d’exportació
                                        </span>
                                        <hr />
                                    </v-card-title>
                                    <v-card-text>
                                        <v-container>
                                            <v-row>
                                                <v-col cols="12" md="4">
                                                        <v-select
                                                        :items="months"
                                                        item-text="name"
                                                        item-value="value"
                                                        v-model="month"
                                                        label="Month"
                                                        ></v-select>
                                                </v-col>
                                                <v-col cols="12" md="4">
                                                        <v-select
                                                        :items="years"
                                                        item-text="name"
                                                        item-value="value"
                                                        v-model="year"
                                                        label="Year"
                                                        ></v-select>
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-card-text>
                                    <v-card-actions>
                                        <div class="flex-grow-1"></div>
                                        <v-btn color="error" @click="excelDialog=false"
                                            >Cancel·lar</v-btn
                                        >
                                        <v-btn
                                            color="primary"
                                            :loading="editedItem.loading"
                                            @click="exportHours"
                                            >Export</v-btn
                                        >
                                    </v-card-actions>
                                </v-card>
                        </v-dialog>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="items"
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
                        <template v-slot:item.active="{ item }">
                            <v-btn
                                small
                                fab
                                depressed
                                :color="item.active == 1 ? 'success' : 'error'"
                            >
                                <v-icon color="white">{{
                                    item.active == 1 ? "check" : "close"
                                }}</v-icon>
                            </v-btn>
                        </template>
                        <template v-slot:item.action="{ item }">
                            <template v-if="$auth.check('crud workers')">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                >
                                    edit
                                </v-icon>
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="
                                        $router.push({
                                            name: 'workers_show',
                                            params: { id: item.id }
                                        })
                                    "
                                >
                                    remove_red_eye
                                </v-icon>
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="openExcelModal(item.id)"
                                >
                                    download
                                </v-icon>
                            </template>
                        </template>
                    </v-data-table>
                </v-card-text>
            </v-card>
        </v-skeleton-loader>
    </v-container>
</template>

<script>
import Modal from "./Modal";
export default {
    components: {
        Modal
    },
    data() {
        return {
            headers: [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Cognoms",
                    value: "last_name"
                },
                {
                    text: "Mail",
                    value: "email"
                },
                {
                    text: "Status",
                    value: "active"
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
            excelDialog:false,
            roles: [],
            items: [],
            month: null,
            workerId:null,
            year: null,
            editedItem: {},
            months : [
                {'name':'Jan','value':'1'},
                {'name':'Feb','value':'2'},
                {'name':'Mar','value':'3'},
                {'name':'Apr','value':'4'},
                {'name':'May','value':'5'},
                {'name':'Jun','value':'6'},
                {'name':'Jul','value':'7'},
                {'name':'Aug','value':'8'},
                {'name':'Sept','value':'9'},
                {'name':'Oct','value':'10'},
                {'name':'Nov','value':'11'},
                {'name':'Dec','value':'12'}
            ],
            years : [
                {'name':'2017','value':'2017'},
                {'name':'2018','value':'2018'},
                {'name':'2019','value':'2019'},
                {'name':'2020','value':'2020'},
                {'name':'2021','value':'2021'}
            ]
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/workers").then(resp => {
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
            });

            this.axios.get("/roles?type=Treballador").then(resp => {
                this.roles = resp.data;
            });
        },

        close() {
            this.dialog = false;
            this.editedIndex = -1;
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.dialog = true;
        },
        openExcelModal(id){
            this.workerId = id;
            this.excelDialog = true;
        },
        exportHours(){
          window.location.href = `/worker/hours/export?worker=${this.workerId}&month=${this.month}&year=${this.year}`;
        },
        async save() {
            let formData = new FormData();

            for (let item in this.editedItem) {
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);
            if (this.editedIndex > -1) {
                formData.append("_method", "patch");
                this.axios
                    .post(`/workers/${this.editedItem.id}`, formData)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/workers", formData)
                    .then(resp => {
                        resp.data.active = 1;
                        this.items.push(resp.data);
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            }
        },
        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (
                confirm(
                    `Estàs segur que vols eliminar aquest pacient? ${item.name} ${item.last_name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/workers/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot eliminar el pacient");
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
                await this.axios.post(`workers/${item.id}/toggle`);
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

<style></style>
