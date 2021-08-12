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
                            <v-subheader>Dates Proveidor</v-subheader>
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.name"
                                label="Nom Empresa"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.cif"
                                label="CIF"
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
                                v-model="editedItem.mobile"
                                label="Mòbil"
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
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.cp"
                                label="CP"
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
                                rules="required|email"
                                v-model="editedItem.email"
                                label="Mail"
                            />
                        </v-col>
                        <v-col cols="12" md="12">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.contact_person"
                                label="Persona de Contacte"
                            />
                        </v-col>
                        <template v-if="type == 'provider'">
                            <v-col cols="12" md="12">
                                <v-subheader>Metodo de Pagament</v-subheader>
                            </v-col>
                            <v-col cols="12" md="4">
                                <v-checkbox
                                    v-model="editedItem.payment_method"
                                    value="cash"
                                    label="Efectiu"
                                ></v-checkbox>
                            </v-col>
                            <v-col cols="12" md="4">
                                <v-checkbox
                                    v-model="editedItem.payment_method"
                                    value="transferencia"
                                    label="Transferencia"
                                ></v-checkbox>
                            </v-col>
                            <v-col cols="12" md="4">
                                <v-checkbox
                                    v-model="editedItem.payment_method"
                                    value="bank"
                                    label="Gir Bancari"
                                ></v-checkbox>
                            </v-col>

                            <v-col cols="12" md="4">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.entity"
                                    label="Entitat"
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
        type: {
            type: String
        }
    },
    data() {
        return {};
    },
    computed: {
        formTitle() {
            return !this.editedItem.id
                ? `Agregar ${this.type}`
                : `Editar ${this.type}`;
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
