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
                            <v-img
                                :key="editedItem.picture"
                                :src="editedItem.picture"
                                style="margin:0 auto"
                                max-width="500"
                                max-height="300"
                                contain
                            ></v-img>
                        </v-col>
                        <v-col cols="12" md="12">
                            <v-file-input
                                v-model="editedItem.file"
                                color="deep-purple accent-4"
                                label="Arxiu"
                                placeholder="Arxiu"
                                prepend-icon="mdi-paperclip"
                                outlined
                                :show-size="1000"
                                @change="renderFile('picture')"
                            >
                                <template
                                    v-slot:selection="{
                                        index,
                                        text,
                                        file
                                    }"
                                >
                                    <v-chip
                                        color="deep-purple accent-4"
                                        dark
                                        label
                                        small
                                    >
                                        {{ text }}
                                    </v-chip>
                                </template>
                            </v-file-input>
                        </v-col>
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
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.dni"
                                label="DNI"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <v-menu
                                v-model="menu"
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
                                    @input="menu = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.tis"
                                label="N* TIS"
                            />
                        </v-col>
                            <v-col cols="12" md="12">
                                <VTextFieldWithValidation
                                v-model="editedItem.residence_address"
                                label="Dirección de residencia"
                                />
                            </v-col>
                           <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules=""
                                v-model="editedItem.cp"
                                label="CP"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules=""
                                v-model="editedItem.population"
                                label="Población"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VSelectWithValidation
                                rules="required"
                                :items="situations"
                                v-model="editedItem.situation"
                                label="Situació Juridica"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VSelectWithValidation
                                rules="required"
                                :items="residence"
                                v-model="editedItem.residence"
                                label="Domicili"
                            />
                        </v-col>
                        <v-col cols="12" xs="12">
                            <v-subheader>Tutela</v-subheader>
                        </v-col>
                        <v-col cols="12" md="4">
                            <VSelectWithValidation
                                rules="required"
                                :items="entities_guardianship"
                                item-text="name"
                                item-value="id"
                                v-model="editedItem.guardianship"
                                label="Entitat"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VSelectWithValidation
                                :items="guardianship_economic"
                                item-text="name"
                                item-value="id"
                                v-model.number="
                                    editedItem.referent_economic_guardianship_id
                                "
                                label="Referent econòmic"
                            />
                        </v-col>
                        <v-col cols="12" md="4">
                            <VSelectWithValidation
                                :items="guardianship_social"
                                item-text="name"
                                item-value="id"
                                v-model.number="
                                    editedItem.referent_social_guardianship_id
                                "
                                label="Ref. Social"
                            />
                        </v-col>
                        <v-col cols="12" xs="12" v-if="editedItem.guardianship != 11">
                            <v-subheader>Residència</v-subheader>
                        </v-col>
                        <v-col cols="12" md="4" v-if="editedItem.guardianship != 11">
                            <VSelectWithValidation
                                rules="required"
                                :items="entities_residence"
                                item-text="name"
                                item-value="id"
                                v-model="editedItem.residency"
                                label="Entitat"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" md="4" v-if="editedItem.guardianship != 11">
                            <VSelectWithValidation
                                rules="required"
                                :items="residence_economic"
                                item-text="name"
                                item-value="id"
                                v-model.number="
                                    editedItem.referent_economic_residence_id
                                "
                                label="Referent Economic"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" md="4" v-if="editedItem.guardianship != 11">
                            <VSelectWithValidation
                                rules="required"
                                :items="residence_social"
                                item-text="name"
                                item-value="id"
                                v-model.number="
                                    editedItem.referent_social_residence_id
                                "
                                label="Referent Social"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" xs="12" v-if="editedItem.guardianship != 11"> 
                            <v-subheader>Àrea econòmica</v-subheader>
                        </v-col>
                        <v-col cols="12" md="6" v-if="editedItem.guardianship != 11">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.bank"
                                label="Entitat Bancària"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" md="6" v-if="editedItem.guardianship != 11">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.iban"
                                label="IBAN"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" md="12" v-if="editedItem.guardianship != 11">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.bic"
                                label="BIC"
                                v-if="editedItem.guardianship != 11"
                            />
                        </v-col>
                        <v-col cols="12" xs="12">
                            <v-subheader>Tipus Contracte</v-subheader>
                        </v-col>
                        <v-col cols="12" md="6">
                            <VSelectWithValidation
                                rules="required"
                                :items="type_contract"
                                item-text="text"
                                item-value="value"
                                v-model="editedItem.type_contract"
                                label="Tipus Contracte"
                            />
                        </v-col>
                         <v-col cols="12" md="6">
                            <VSelectWithValidation
                                rules="required"
                                :items="types"
                                multiple
                                item-text="text"
                                item-value="text"
                                v-model="editedItem.types"
                                label="Annexes"
                            />
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
import PatientMixin from "./patients";
export default {
    mixins: [PatientMixin],
    props: {
        editedItem: {
            type: Object
        },
        entities_guardianship: {
            type: Array
        },
        entities_residence: {
            type: Array
        },
        referents: {
            type: Array
        }
    },
    data() {

        return {
            type_contract: [
                {
                    value: "0",
                    text: "Client plena capacitat "
                },
                {
                    value: "1",
                    text: "Client incapacitat + tutor legal (familiar)"
                },
                {
                    value: "2",
                    text: "Client incapacitat + tutor legal (entitat)"
                }
            ],
            types : [
               {
                 text  : "Compte Bancari",
                 value : "Compte Bancari"
               },
               {
                 text  : "Claus",
                 value : "Claus"
               },
               {
                 text  : "Injectables",
                 value : "Injectables"
               },
               {
                 text  : "Medicacio",
                 value : "Medicacio"
               },
               {
                 text  : "Cures",
                 value : "Cures"
               },
               {
                 text  : "Consentiment",
                 value : "Consentiment"
               }
            ]
        };
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? "Agregar Pacients" : "Editar Pacients";
        }
    },
    methods: {
        async save(validate) {
            if (!(await validate())) return;
            this.$emit("save");
        },
        close() {
            this.$emit("close");
        }
    }
};
</script>

<style></style>
