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
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.number"
                                label="Numero Fac"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.base"
                                label="Base Fac"
                            />
                        </v-col>
                        <template v-if="type == 'provider'">
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.iva_0"
                                    label="IVA 0%"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.iva_4"
                                    label="IVA 4%"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.iva_10"
                                    label="IVA 10%"
                                />
                            </v-col>
                            <v-col cols="12" md="6">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.iva_21"
                                    label="IVA 21%"
                                />
                            </v-col>
                            <v-col cols="12" md="12">
                                <VTextFieldWithValidation
                                    rules=""
                                    v-model="editedItem.irpf"
                                    label="IRPF"
                                />
                            </v-col>
                        </template>

                        <template v-if="type == 'bank'">
                            <v-col cols="12" md="12">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.interests"
                                    label="Interesos"
                                />
                            </v-col>
                        </template>

                        <template v-if="type == 'state'">
                            <v-col cols="12" md="12">
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="editedItem.invoice_type"
                                    label="Tipus de impost"
                                />
                            </v-col>
                        </template>

                        <v-col cols="12" md="6">
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
                                        v-model="editedItem.start_date"
                                        label="Data Factura"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.start_date"
                                    @input="menu = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-menu
                                v-model="menu1"
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
                                        v-model="editedItem.due_date"
                                        label="Data Venciment"
                                        prepend-icon="event"
                                        readonly
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="editedItem.due_date"
                                    @input="menu1 = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>

                        <v-col cols="12" md="12">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.total"
                                label="Total Fac"
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
export default {
    props: {
        editedItem: {
            type: Object
        },
        id: {
            type: String
        },
        type: {
            type: String
        }
    },
    data() {
        return {
            menu: false,
            menu1: false
        };
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? `Agregar Fra` : `Editar Fractura`;
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
