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
                        <v-col cols="12" md="4">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.name"
                                label="Nom"
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
                            <VTextFieldWithValidation
                                rules=""
                                v-model="editedItem.password"
                                label="Contrasenya"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required|email"
                                v-model="editedItem.email"
                                label="Mail"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.phone"
                                label="Telèfon"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.population"
                                label="Població"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.cp"
                                label="CP"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.province"
                                label="Província"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.address"
                                label="Adreça"
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
                                v-model="editedItem.grau_de_parentiu"
                                label="Grau de parentiu"
                            />
                        </v-col>
                        <v-col cols="12" md="6" v-if="editedItem.role_id != 7">
                            <VSelectWithValidation
                                :rules="
                                    editedItem.role_id == 7 ? '' : 'required'
                                "
                                :items="entities"
                                item-text="name"
                                item-value="id"
                                v-model="editedItem.entity_id"
                                label="Entitat"
                            />
                        </v-col>
                        <template v-if="editedItem.role_id == 7">
                            <v-col cols="12" md="12">
                                <v-subheader>Entitat</v-subheader>
                            </v-col>
                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].name"
                                    label="Nom"
                                />
                            </v-col>
                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].cif"
                                    label="CIF"
                                />
                            </v-col>
                            <v-col cols="12" md="4">
                                <VSelectWithValidation
                                    rules="required"
                                    :items="entities_types"
                                    v-model="editedItem['entity'].type"
                                    label="Tipus"
                                >
                                </VSelectWithValidation>
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].population"
                                    label="Població"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].cp"
                                    label="CP"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].province"
                                    label="Província"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].phone"
                                    label="Telèfon"
                                />
                            </v-col>
                            <v-col cols="12" md="12">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].address"
                                    label="Adreça"
                                />
                            </v-col>
                            <v-col cols="12" xs="12" v-if="editedItem.role_id != 7">
                                <v-subheader>Àrea econòmica</v-subheader>
                            </v-col>
                            <v-col cols="12" md="6" v-if="editedItem.role_id != 7">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].bank"
                                    label="Entitat Bancària"
                                />
                            </v-col>
                            <v-col cols="12" md="6" v-if="editedItem.role_id != 7">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].iban"
                                    label="IBAN"
                                />
                            </v-col>
                            <v-col cols="12" md="12" v-if="editedItem.role_id != 7">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem['entity'].bic"
                                    label="BIC"
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
        entities: {
            type: Array
        },
        roles: {
            type: Array
        }
    },
    created() {
        if (!this.editedItem.entity) {
            this.editedItem.entity = {};
        }
    },
    data() {
        return {
            entities_types: [
                {
                    value: "residencia",
                    text: "Residència"
                },
                {
                    value: "tutela",
                    text: "Tutela"
                }
            ]
        };
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? "Agregar Referent" : "Editar Referent";
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
