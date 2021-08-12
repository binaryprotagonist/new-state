<template>
    <v-container>
        <ValidationObserver
            ref="obs"
            v-slot="{
                invalid,
                validated,
                passes,
                validate
            }"
        >
            <v-row>
                <v-col cols="12" md="12">
                    <v-card :loading="editedItem.loading" elevation="2">
                        <v-toolbar>
                            <v-toolbar-title>
                                <v-icon
                                    @click="$router.push({ name: 'tasks' })"
                                    >chevron_left</v-icon
                                >
                                {{ formTitle }}</v-toolbar-title
                            >
                            <v-spacer></v-spacer>
                            <v-btn
                                v-if="!isEditing"
                                @click="isEditing = true"
                                color="primary"
                                small
                                fab
                            >
                                <v-icon>
                                    edit
                                </v-icon>
                            </v-btn>
                            <template v-else>
                                <v-btn
                                    :loading="editedItem.loading"
                                    @click="save"
                                    color="primary"
                                    small
                                    fab
                                >
                                    <v-icon>
                                        save
                                    </v-icon>
                                </v-btn>
                                <v-btn
                                    class="ml-2"
                                    @click="cancel"
                                    color="error"
                                    small
                                    fab
                                >
                                    <v-icon>
                                        close
                                    </v-icon>
                                </v-btn>
                            </template>
                        </v-toolbar>
                        <v-card-text>
                            <v-container>
                                <v-row align="center">
                                    <v-col cols="12" md="12">
                                        <v-subheader
                                            >Dates generals</v-subheader
                                        >
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VAutoCompleteWithValidation
                                            rules="required"
                                            :items="patients"
                                            :item-text="
                                                v => v.name + ' ' + v.last_name
                                            "
                                            item-value="id"
                                            prepend-icon="person"
                                            v-model="editedItem.patient_id"
                                            label="Pacient"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="visit_type"
                                            prepend-icon="favorite_border"
                                            v-model="editedItem.visit_type"
                                            label="Tipus"
                                            :disabled="!isEditing"
                                            outlined
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-menu
                                            v-model="editedItem.start_date_menu"
                                            :close-on-content-click="false"
                                            :nudge-right="40"
                                            transition="scale-transition"
                                            offset-y
                                            min-width="290px"
                                        >
                                            <template
                                                v-slot:activator="{
                                                    on
                                                }"
                                            >
                                                <VTextFieldWithValidation
                                                    rules="required"
                                                    refs="start_date"
                                                    label="Data d`inici"
                                                    prepend-icon="event"
                                                    readonly="readonly"
                                                    v-on="on"
                                                    v-model="
                                                        editedItem.start_date
                                                    "
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></VTextFieldWithValidation>
                                            </template>
                                            <v-date-picker
                                                v-model="editedItem.start_date"
                                                @input="
                                                    editedItem.start_date_menu = false
                                                "
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-menu
                                            ref="menu"
                                            v-model="editedItem.start_time_menu"
                                            :close-on-content-click="false"
                                            :nudge-right="40"
                                            :return-value.sync="
                                                editedItem.start_time
                                            "
                                            transition="scale-transition"
                                            offset-y
                                            max-width="290px"
                                            min-width="290px"
                                        >
                                            <template v-slot:activator="{ on }">
                                                <VTextFieldWithValidation
                                                    rules="required"
                                                    v-model="
                                                        editedItem.start_time
                                                    "
                                                    label="Hora d´inici"
                                                    prepend-icon="access_time"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></VTextFieldWithValidation>
                                            </template>
                                            <v-time-picker
                                                v-if="
                                                    editedItem.start_time_menu
                                                "
                                                v-model="editedItem.start_time"
                                                full-width
                                                @click:minute="
                                                    $refs.menu.save(
                                                        editedItem.start_time
                                                    )
                                                "
                                                :disabled="!isEditing"
                                                outlined
                                            ></v-time-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-menu
                                            v-model="editedItem.end_date_menu"
                                            :close-on-content-click="false"
                                            :nudge-right="40"
                                            transition="scale-transition"
                                            offset-y
                                            min-width="290px"
                                        >
                                            <template
                                                v-slot:activator="{
                                                    on
                                                }"
                                            >
                                                <VTextFieldWithValidation
                                                    rules="required"
                                                    v-model="
                                                        editedItem.end_date
                                                    "
                                                    label="Data de finalització"
                                                    prepend-icon="event"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></VTextFieldWithValidation>
                                            </template>
                                            <v-date-picker
                                                v-model="editedItem.end_date"
                                                @input="
                                                    editedItem.end_date_menu = false
                                                "
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-menu
                                            ref="menu1"
                                            v-model="editedItem.end_time_menu"
                                            :close-on-content-click="false"
                                            :nudge-right="40"
                                            :return-value.sync="
                                                editedItem.end_time
                                            "
                                            transition="scale-transition"
                                            offset-y
                                            max-width="290px"
                                            min-width="290px"
                                        >
                                            <template v-slot:activator="{ on }">
                                                <VTextFieldWithValidation
                                                    rules="required"
                                                    v-model="
                                                        editedItem.end_time
                                                    "
                                                    label="Hora de finalització"
                                                    prepend-icon="access_time"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></VTextFieldWithValidation>
                                            </template>
                                            <v-time-picker
                                                v-if="editedItem.end_time_menu"
                                                v-model="editedItem.end_time"
                                                full-width
                                                @click:minute="
                                                    $refs.menu1.save(
                                                        editedItem.end_time
                                                    )
                                                "
                                            ></v-time-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VTextFieldWithValidation
                                            v-model="editedItem.description"
                                            prepend-icon="short_text"
                                            label="Descripció"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <v-subheader>Recursivitat</v-subheader>
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VSelectWithValidation
                                            rules=""
                                            :items="periodic_types"
                                            prepend-icon="event_note"
                                            v-model="
                                                editedItem.dates.periodic.type
                                            "
                                            label="Es repeteix"
                                            :disabled="!isEditing"
                                            outlined
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col
                                        v-if="editedItem.dates.periodic.type"
                                        cols="12"
                                        md="6"
                                    >
                                        <VTextFieldWithValidation
                                            rules="required"
                                            prepend-icon="event_note"
                                            v-model="
                                                editedItem.dates.periodic
                                                    .frequency.number
                                            "
                                            label="Numero de repetició"
                                            :disabled="!isEditing"
                                            outlined
                                        >
                                        </VTextFieldWithValidation>
                                    </v-col>
                                    <v-col
                                        cols="12"
                                        md="6"
                                        v-if="
                                            editedItem.dates.periodic.type ==
                                                'weeks'
                                        "
                                        :disabled="!isEditing"
                                        outlined
                                    >
                                        <VSelectWithValidation
                                            rules="required|min:0|max:6"
                                            :items="frequency_days"
                                            prepend-icon="event_note"
                                            v-model="
                                                editedItem.dates.periodic
                                                    .frequency.day_of_week
                                            "
                                            label="Dies que es repeteix"
                                            :disabled="!isEditing"
                                            outlined
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col
                                        v-if="
                                            editedItem.dates.periodic.type ==
                                                'months'
                                        "
                                        cols="12"
                                        md="6"
                                    >
                                        <VTextFieldWithValidation
                                            rules="required|min:1|max:31"
                                            prepend-icon="event_note"
                                            v-model="
                                                editedItem.dates.periodic
                                                    .frequency.day_of_month
                                            "
                                            label="Dies que es repeteix"
                                            :disabled="!isEditing"
                                            outlined
                                        >
                                        </VTextFieldWithValidation>
                                    </v-col>
                                    <v-col
                                        cols="12"
                                        md="6"
                                        v-if="editedItem.dates.periodic.type"
                                    >
                                        <v-menu
                                            v-model="
                                                editedItem.end_periodic_date
                                            "
                                            :close-on-content-click="false"
                                            :nudge-right="40"
                                            transition="scale-transition"
                                            offset-y
                                            min-width="290px"
                                        >
                                            <template
                                                v-slot:activator="{
                                                    on
                                                }"
                                            >
                                                <VTextFieldWithValidation
                                                    rules="required"
                                                    v-model="
                                                        editedItem.dates
                                                            .periodic.frequency
                                                            .end.date
                                                    "
                                                    label="Data de finalització"
                                                    prepend-icon="event"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></VTextFieldWithValidation>
                                            </template>
                                            <v-date-picker
                                                v-model="
                                                    editedItem.dates.periodic
                                                        .frequency.end.date
                                                "
                                                @input="
                                                    editedItem.end_periodic_date = false
                                                "
                                                :disabled="!isEditing"
                                                outlined
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="12">
                    <v-expansion-panels accordion>
                        <v-expansion-panel color="success">
                            <v-expansion-panel-header>
                                <v-subheader>Despeses</v-subheader>
                            </v-expansion-panel-header>
                            <v-expansion-panel-content>
                                <v-row>
                                    <v-col cols="12" md="8">
                                        <VSelectWithValidation
                                            :items="editedItem.workers"
                                            v-model="activeWorker"
                                            :item-text="
                                                v => v.name + ' ' + v.last_name
                                            "
                                            return-object
                                            label="Treballador"
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col cols="12" md="4">
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
                                            <ExpensesModal
                                                v-if="dialog"
                                                :editedItem="editedItem"
                                                :activeWorker="activeWorker"
                                                :expenses="expenses"
                                                @save="save"
                                                @close="closeDialog"
                                            ></ExpensesModal>
                                        </v-dialog>
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <v-data-table
                                            :headers="expensesHeaders"
                                            :items="
                                                getWorkerExpenses(
                                                    activeWorker.id
                                                )
                                            "
                                            :search="search"
                                            :rowsPerPageItems="rowsPerPage"
                                            ref="content"
                                        >
                                        </v-data-table>
                                    </v-col>
                                </v-row>
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels>
                </v-col>

                <v-col cols="12" md="12">
                    <v-expansion-panels accordion>
                        <v-expansion-panel color="success">
                            <v-expansion-panel-header>
                                <v-subheader>Hours</v-subheader>
                            </v-expansion-panel-header>
                            <v-expansion-panel-content>
                                <v-row>
                                    <v-col cols="12" md="8">
                                        <VSelectWithValidation
                                            :items="editedItem.workers"
                                            v-model="activeWorker"
                                            :item-text="
                                                v => v.name + ' ' + v.last_name
                                            "
                                            return-object
                                            label="Treballador"
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col cols="12" md="4">
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

                                            <HoursModal
                                                v-if="dialog"
                                                :editedItem="editedItem"
                                                :activeWorker="activeWorker"
                                                :hours="hours"
                                                @save="save"
                                                @close="closeDialog"
                                            ></HoursModal>
                                        </v-dialog>
                                    </v-col>

                                    <v-col cols="12" md="12">
                                        <v-data-table
                                            :headers="hoursHeaders"
                                            :items="
                                                getWorkerHours(activeWorker.id)
                                            "
                                            :search="search"
                                            :rowsPerPageItems="rowsPerPage"
                                            ref="content"
                                        >
                                        </v-data-table>
                                    </v-col>
                                </v-row>
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels>
                </v-col>

                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="`tasks/${editedItem.id}/gallery`"
                        :deleteUrl="`company/delete/gallery`"
                    ></v-gallery>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>

<script>
import VGallery from "@/components/VGallery";
import ExpensesModal from "./ExpensesModal";
import HoursModal from "./HoursModal";

export default {
    components: {
        VGallery,
        ExpensesModal,
        HoursModal
    },
    data() {
        return {
            editedItem: {},
            patient: {},
            isEditing: false,
            search: "",
            extended: false,
            patients: [],
            activeWorker: {},
            dialog: false,
            expenses: [],
            hours: [],
            expensesHeaders: [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Preu",
                    value: "pivot.price"
                }
            ],
            hoursHeaders: [
                {
                    text: "Data",
                    value: "date_worked"
                },
                {
                    text: "Hores",
                    value: "total_hours"
                }
            ],
            visit_type: [
                "Visita mèdica",
                "Urgència mèdica",
                "Hospitalització",
                "Activitats"
            ],
            periodic_types: [
                {
                    text: "Sense repetició",
                    value: ""
                },
                {
                    text: "Cada dia",
                    value: "days"
                },
                {
                    text: "Cada setmana",
                    value: "weeks"
                },
                {
                    text: "Cada mes",
                    value: "months"
                }
                // {
                //     text: "Cada any",
                //     value: "years"
                // }
            ],
            frequency_days: [
                {
                    text: "Dilluns",
                    value: 1
                },
                {
                    text: "Dimarts",
                    value: 2
                },
                {
                    text: "Dimecres",
                    value: 3
                },
                {
                    text: "Dijous",
                    value: 4
                },
                {
                    text: "Divendres",
                    value: 5
                },
                {
                    text: "Dissabte",
                    value: 6
                },
                {
                    text: "Diumenge",
                    value: 0
                }
            ]
        };
    },
    computed: {
        formTitle() {
            return !this.isEditing ? "Ver Tàsques " : "Editar Tàsques ";
        }
    },
    created() {
        this.initialize();

        if (!this.editedItem.dates) {
            this.editedItem.dates = {
                periodic: {
                    frequency: {
                        end: {
                            type: "date"
                        }
                    }
                }
            };
        }
    },
    methods: {
        initialize() {
            this.axios.get(`tasks/${this.$route.params.id}`).then(resp => {

                this.editedItem = resp.data;

                let start = this.editedItem.start_date.split(" ");
                this.editedItem.start_date = start[0];
                this.editedItem.start_time = start[1];

                let end = this.editedItem.end_date.split(" ");
                this.editedItem.end_date = end[0];
                this.editedItem.end_time = end[1];

                if (this.editedItem.workers.length >= 1)
                    this.activeWorker = this.editedItem.workers[0];

                this.patient = JSON.parse(JSON.stringify(this.editedItem));
            });

            this.axios.get("/patients").then(resp => {
                this.patients = resp.data;
            });

            this.axios.get("/expenses").then(resp => {
                this.expenses = resp.data;
            });

            this.axios.get("/hours").then(resp => {
                this.hours = resp.data;
            });
        },
        save() {
            let formData = new FormData();

            this.editedItem.start_date = `${this.editedItem.start_date} ${this.editedItem.start_time}`;
            this.editedItem.end_date = `${this.editedItem.end_date} ${this.editedItem.end_time}`;

            for (let item in this.editedItem) {
                // if (typeof this.editedItem[item] === "object") {
                //     this.editedItem[item] = new Blob(
                //         [JSON.stringify(this.editedItem[item])],
                //         { type: "application/json" }
                //     ); // or just JSON.stringify(value)
                // }
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);
            this.editedItem["_method"] = "patch";
            // formData.append("_method", "patch");
            this.axios
                .post(`/tasks/${this.editedItem.id}`, this.editedItem)
                .then(resp => {
                    Object.assign(this.editedItem, resp.data);
                    this.isEditing = false;
                    this.editedItem.loading = false;
                })
                .catch(() => {
                    this.isEditing = false;
                    this.editedItem.loading = false;
                });
        },
        cancel() {
            this.editedItem = JSON.parse(JSON.stringify(this.patient));
            this.isEditing = false;
        },
        closeDialog() {
            this.dialog = false;
        },
        async saveDialog() {
            this.$set(this.editedItem, "loading", true);
            this.$set(this.editedItem, "type", this.type);
            if (this.editedIndex > -1) {
                this.axios
                    .put(`/tasks/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
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
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            }
        },
        getWorkerExpenses(id) {
            if (!this.editedItem.expenses) return;
            return this.editedItem.expenses.filter(item => {
                return item.pivot.worker_id == id;
            });
        },
        getWorkerHours(id) {
            if (!this.editedItem.hour) return;
            return this.editedItem.hour.filter(item => {
                return item.worker_id == id;
            });
        }
    }
};
</script>

<style></style>
