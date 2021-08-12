<template>
    <ValidationObserver
        ref="obs"
        v-slot="{
            invalid,
            validated,
            passes,
            validate
        }"
    >
        <v-card>
            <v-card-title>
                <span class="headline">
                    {{ formTitle }}
                </span>
            </v-card-title>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="8">
                            <VAutoCompleteWithValidation
                                rules="required"
                                :items="patients"
                                :item-text="v => v.name + ' ' + v.last_name"
                                item-value="id"
                                prepend-icon="person"
                                v-model="editedItem.patient_id"
                                label="Pacient"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VSelectWithValidation
                                rules="required"
                                :items="visit_type"
                                prepend-icon="favorite_border"
                                v-model="editedItem.visit_type"
                                label="Tipus"
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
                                        readonly= "readonly"
                                        v-on="on"
                                        v-model="editedItem.start_date"
                                    ></VTextFieldWithValidation>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.start_date"
                                    @input="editedItem.start_date_menu = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-menu
                                ref="menu"
                                v-model="editedItem.start_time_menu"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                :return-value.sync="editedItem.start_time"
                                transition="scale-transition"
                                offset-y
                                max-width="290px"
                                min-width="290px"
                            >
                                <template v-slot:activator="{ on }">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.start_time"
                                        label="Hora d`inici"
                                        prepend-icon="access_time"
                                        readonly
                                        v-on="on"
                                    ></VTextFieldWithValidation>
                                </template>
                                <v-time-picker
                                    v-if="editedItem.start_time_menu"
                                    v-model="editedItem.start_time"
                                    full-width
                                    @click:minute="
                                        $refs.menu.save(editedItem.start_time)
                                    "
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
                                        v-model="editedItem.end_date"
                                        label="Data de finalització"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></VTextFieldWithValidation>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.end_date"
                                    @input="editedItem.end_date_menu = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-menu
                                ref="menu1"
                                v-model="editedItem.end_time_menu"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                :return-value.sync="editedItem.end_time"
                                transition="scale-transition"
                                offset-y
                                max-width="290px"
                                min-width="290px"
                            >
                                <template v-slot:activator="{ on }">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.end_time"
                                        label="Hora de finalització"
                                        prepend-icon="access_time"
                                        readonly
                                        v-on="on"
                                    ></VTextFieldWithValidation>
                                </template>
                                <v-time-picker
                                    v-if="editedItem.end_time_menu"
                                    v-model="editedItem.end_time"
                                    full-width
                                    @click:minute="
                                        $refs.menu1.save(editedItem.end_time)
                                    "
                                ></v-time-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="12">
                            <VTextFieldWithValidation
                                v-model="editedItem.description"
                                prepend-icon="short_text"
                                label="Descripció"
                            />
                        </v-col>
                           <v-col cols="12" md="8">
                            <VAutoCompleteWithValidation
                                rules="required"
                                :items="services"
                                :item-text="v => v.name"
                                item-value="id"
                                v-model="editedItem.service_id"
                                label="Services"
                                prepend-icon="short_text"
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
                                v-model="editedItem.dates.periodic.type"
                                label="Es repeteix"
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
                                    editedItem.dates.periodic.frequency.number
                                "
                                label="Numero de repetició"
                            >
                            </VTextFieldWithValidation>
                        </v-col>
                        <v-col
                            cols="12"
                            md="6"
                            v-if="editedItem.dates.periodic.type == 'weeks'"
                        >
                            <VSelectWithValidation
                                rules="required|min:0|max:6"
                                :items="frequency_days"
                                prepend-icon="event_note"
                                v-model="
                                    editedItem.dates.periodic.frequency
                                        .day_of_week
                                "
                                label="Dies que es repeteix"
                            >
                            </VSelectWithValidation>
                        </v-col>
                        <v-col
                            v-if="editedItem.dates.periodic.type == 'months'"
                            cols="12"
                            md="6"
                        >
                            <VTextFieldWithValidation
                                rules="required|min:1|max:31"
                                prepend-icon="event_note"
                                v-model="
                                    editedItem.dates.periodic.frequency
                                        .day_of_month
                                "
                                label="Dies que es repeteix"
                            >
                            </VTextFieldWithValidation>
                        </v-col>
                        <v-col
                            cols="12"
                            md="6"
                            v-if="editedItem.dates.periodic.type"
                        >
                            <v-menu
                                v-model="editedItem.end_periodic_date"
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
                                            editedItem.dates.periodic.frequency
                                                .end.date
                                        "
                                        label="Data de finalització"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></VTextFieldWithValidation>
                                </template>
                                <v-date-picker
                                    v-model="
                                        editedItem.dates.periodic.frequency.end
                                            .date
                                    "
                                    @input="
                                        editedItem.end_periodic_date = false
                                    "
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card-text>
            <v-card-actions>
                <div class="flex-grow-1"></div>
                <v-btn color="error" @click="close">Cancel·lar</v-btn>
                <v-btn
                    color="primary"
                    :loading="editedItem.loading"
                    @click="save(validate)"
                    >Desa</v-btn
                >
            </v-card-actions>
        </v-card>
    </ValidationObserver>
</template>

<script>
export default {
    props: {
        editedItem: {
            type: Object
        },
        type: {
            type: String
        },
        patients: {
            type: Array
        },
        services : {
            type : Array
        }
    },
    data() {
        return {
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
                //     text: "Cada anio",
                //     value: "years"
                // }
            ],
            frequency_days: [
                {
                    text: "Lunes",
                    value: 1
                },
                {
                    text: "Martes",
                    value: 2
                },
                {
                    text: "Miércoles",
                    value: 3
                },
                {
                    text: "Jueves",
                    value: 4
                },
                {
                    text: "Viernes",
                    value: 5
                },
                {
                    text: "Sábado",
                    value: 6
                },
                {
                    text: "Domingo",
                    value: 0
                }
            ]
        };
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? `Agregar Tasca` : `Editar Tasca`;
        }
    },
    created() {
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


        if (this.editedItem.id) {
            let start = this.editedItem.start_date.split(" ");
            this.editedItem.start_date = start[0];
            if(typeof start[1] != 'undefined' && start[1] != null && start[1] != null && start[1] != "")
            this.editedItem.start_time = start[1];

            let end = this.editedItem.end_date.split(" ");
            this.editedItem.end_date = end[0];
            this.editedItem.end_time = end[1];
        }
    },
    methods: {


        async save(validate) {
            if (!(await validate())) return;
            if(typeof this.editedItem.start_time != 'undefined')
             this.editedItem.start_date = `${this.editedItem.start_date} ${this.editedItem.start_time}`;
            else
                this.editedItem.start_date = `${this.editedItem.start_date}`;

            this.editedItem.end_date = `${this.editedItem.end_date} ${this.editedItem.end_time}`;
            if (!this.editedItem.id) {
                this.editedItem.status = "pendents";
            }

            if (!this.editedItem.description) {
                this.editedItem.description = "  ";
            }

            if (!this.editedItem.dates) {
                this.editedItem.dates = {};
            }

            this.$emit("save");
        },
        close() {
            this.$emit("close");
        }
    }
};
</script>

<style></style>
