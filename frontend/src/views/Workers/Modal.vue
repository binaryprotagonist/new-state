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
                        <v-col cols="12" md="12">
                            <v-subheader>Dates generals</v-subheader>
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.name"
                                label="Nom"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.last_name"
                                label="Cognoms"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                :rules="`${editedItem.id ? '' : 'required'}`"
                                v-model="editedItem.password"
                                label="contrasenya"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VSelectWithValidation
                                rules="required"
                                :items="roles"
                                item-text="name"
                                item-value="id"
                                v-model="editedItem.role_id"
                                label="Tipus"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.dni"
                                label="DNI"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-menu
                                v-model="editedItem.birth_date_menu"
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
                                    <v-text-field
                                        v-model="editedItem.birth_date"
                                        label="Data de Neixement"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.birth_date"
                                    @input="editedItem.birth_date_menu = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>

                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.cp"
                                label="CP"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.population"
                                label="Població"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.phone"
                                label="Telèfon"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules=""
                                v-model="editedItem.mobile"
                                label="Mòbil"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.email"
                                label="Mail"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.company_email"
                                label="Mail d´empresa"
                            />
                        </v-col>
                        <v-col cols="12" md="8">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.address"
                                label="Adreça"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.cost_per_hours"
                                label="Cost per hora"
                            />
                        </v-col>
                        <v-col cols="12" xs="12">
                            <v-subheader>Dates Bancaries</v-subheader>
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.banking_entity"
                                label="Entitat Bancària"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.iban"
                                label="IBAN"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.bic"
                                label="BIC"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-row align="center">
                                <v-col cols="12" md="8">
                                    <v-subheader
                                        >Formació acadèmica</v-subheader
                                    >
                                </v-col>
                                <VTextFieldWithValidation
                                    v-model="tempAcademic"
                                    label="Formació acadèmica"
                                />
                                <v-col cols="12" md="4">
                                    <v-btn
                                        @click="addAcademic"
                                        small
                                        color="success"
                                        fab
                                    >
                                        <v-icon>add</v-icon>
                                    </v-btn>
                                </v-col>
                                <v-col
                                    :key="academic + index"
                                    v-for="(academic,
                                    index) in editedItem.academic_training"
                                    cols="12"
                                    md="12"
                                >
                                    <v-row align="center">
                                        <v-col cols="12" md="8">
                                            {{ academic }}
                                        </v-col>
                                        <v-col cols="12" md="2">
                                            <v-btn
                                                @click="removeAcademic(index)"
                                                class="ml-2"
                                                small
                                                color="error"
                                                fab
                                            >
                                                <v-icon>close</v-icon>
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-row>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-row align="center">
                                <v-col cols="12" md="8">
                                    <v-subheader
                                        >Experiència Laboral</v-subheader
                                    >
                                </v-col>
                                <v-col cols="12" md="8">
                                    <VTextFieldWithValidation
                                        v-model.lazy="tempWork"
                                        label="Experiència"
                                    />
                                </v-col>
                                <v-col cols="12" md="4">
                                    <v-btn
                                        @click="addExperience"
                                        small
                                        color="success"
                                        fab
                                    >
                                        <v-icon>add</v-icon>
                                    </v-btn>
                                </v-col>

                                <v-col
                                    :key="academic + index"
                                    v-for="(academic,
                                    index) in editedItem.work_experience"
                                    cols="12"
                                    md="12"
                                >
                                    <v-row align="center">
                                        {{ academic }}
                                        <v-col cols="12" md="4">
                                            <v-btn
                                                @click="removeExperience(index)"
                                                class="ml-2"
                                                small
                                                color="error"
                                                fab
                                            >
                                                <v-icon>close</v-icon>
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-row>
                        </v-col>

                        <v-col cols="12" xs="12">
                            <v-subheader>Tipus de contracte</v-subheader>
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.type_of_contract"
                                label="Tipus de contracte"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.working_day"
                                label="Jornada"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-menu
                                v-model="editedItem.initial_date_menu"
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
                                    <v-text-field
                                        v-model="editedItem.initial_date"
                                        label="Data d´inici"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.initial_date"
                                    @input="
                                        editedItem.initial_date_menu = false
                                    "
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-menu
                                v-model="editedItem.renewal_date_menu"
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
                                    <v-text-field
                                        v-model="editedItem.renewal_date"
                                        label="Data de renovació"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.renewal_date"
                                    @input="
                                        editedItem.renewal_date_menu = false
                                    "
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.contract_duration"
                                label="Duració del contracte"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.category"
                                label="Categoria"
                            />
                        </v-col>

                        <template>
                            <v-col cols="12" xs="12">
                                <v-subheader>Nòmines</v-subheader>
                            </v-col>
                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.import"
                                    label="Import brut"
                                />
                            </v-col>
                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.irpf"
                                    label="IRPF"
                                />
                            </v-col>
                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.total_import"
                                    label="Import Total"
                                />
                            </v-col>
                        </template>
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
        roles: {
            type: Array
        }
    },
    data() {
        return {
            tempAcademic: "",
            tempWork: ""
        };
    },
    computed: {
        formTitle() {
            return !this.editedItem.id
                ? "Agregar Treballador"
                : "Editar Treballador";
        }
    },
    methods: {
        async save(validate) {
            if (!(await validate())) return;
            this.$emit("save");
        },
        close() {
            this.$emit("close");
        },
        getIndex(list, id) {
            return list.findIndex(e => e.id == id);
        },
        addAcademic() {
            if (!this.editedItem.academic_training)
                this.$set(this.editedItem, "academic_training", []);
            this.editedItem.academic_training.push(this.tempAcademic);
        },
        addExperience() {
            if (!this.editedItem.work_experience)
                this.$set(this.editedItem, "work_experience", []);
            this.editedItem.work_experience.push(this.tempWork);
        },
        saveAcademic(index) {
            this.editedItem.academic_training.push(index, this.tempAcademic);
        },
        removeAcademic(index) {
            console.log(this.editedItem.academic_training)
            this.editedItem.academic_training.splice(index, 1);
        },
        removeExperience(index) {
            this.editedItem.work_experience.splice(index, 1);
        }
    }
};
</script>

<style></style>
