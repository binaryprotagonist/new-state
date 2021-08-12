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
                                    @click="$router.push({ name: 'providers' })"
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
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.name"
                                            label="Nom Empresa"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.cif"
                                            label="CIF"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.phone"
                                            label="Telèfon"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.mobil"
                                            label="Mòbil"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.address"
                                            label="Adreça"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.cp"
                                            label="CP"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.population"
                                            label="Població"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required|email"
                                            v-model="editedItem.email"
                                            label="Mail"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <!-- <v-col cols="12" md="6">
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
                                                    v-model="
                                                        editedItem.birth_date
                                                    "
                                                    label="Data de Neixement"
                                                    prepend-icon="event"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker
                                                v-model="editedItem.birth_date"
                                                @input="menu = false"
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col> -->
                                    <template
                                        v-if="editedItem.type == 'provider'"
                                    >
                                        <v-col cols="12" md="12">
                                            <v-subheader
                                                >Metodo de Pagament</v-subheader
                                            >
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <v-checkbox
                                                v-model="
                                                    editedItem.payment_method
                                                "
                                                value="cash"
                                                label="Efectiu"
                                                :disabled="!isEditing"
                                                outlined
                                            ></v-checkbox>
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <v-checkbox
                                                v-model="
                                                    editedItem.payment_method
                                                "
                                                value="transferencia"
                                                label="Transferencia"
                                                :disabled="!isEditing"
                                                outlined
                                            ></v-checkbox>
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <v-checkbox
                                                v-model="
                                                    editedItem.payment_method
                                                "
                                                value="bank"
                                                label="Gir Bancari"
                                                :disabled="!isEditing"
                                                outlined
                                            ></v-checkbox>
                                        </v-col>

                                        <v-col cols="12" md="4">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                v-model="editedItem.entity"
                                                label="Entitat"
                                                :disabled="!isEditing"
                                                outlined
                                            />
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                v-model="editedItem.iban"
                                                label="IBAN"
                                                :disabled="!isEditing"
                                                outlined
                                            />
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                v-model="editedItem.bic"
                                                label="BIC"
                                                :disabled="!isEditing"
                                                outlined
                                            />
                                        </v-col>
                                    </template>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="12">
                    <Invoices
                        :type="editedItem.type"
                        :id="$route.params.id"
                    ></Invoices>
                </v-col>
                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="`providers/${editedItem.id}/gallery`"
                        :deleteUrl="'company/delete/gallery'"
                    ></v-gallery>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>

<script>
import VGallery from "@/components/VGallery";
import Invoices from "./Invoices";
export default {
    components: {
        VGallery,
        Invoices
    },
    data() {
        return {
            editedItem: {},
            patient: {},
            isEditing: false,
            search: "",
            extended: false
        };
    },
    computed: {
        formTitle() {
            return !this.isEditing ? "Ver Proveidor" : "Editar Proveidor";
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios.get(`providers/${this.$route.params.id}`).then(resp => {
                this.editedItem = resp.data;
                this.patient = JSON.parse(JSON.stringify(this.editedItem));
            });
        },
        save() {
            let formData = new FormData();

            for (let item in this.editedItem) {
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);
            formData.append("_method", "patch");
            this.axios
                .post(`/providers/${this.editedItem.id}`, formData)
                .then(resp => {
                    Object.assign(this.editedItem, resp.data);
                    this.isEditing = false;
                    this.editedItem.loading = false;
                })
                .catch(err => {
                    this.isEditing = false;
                    this.editedItem.loading = false;
                });
        },
        cancel() {
            this.editedItem = JSON.parse(JSON.stringify(this.patient));
            this.isEditing = false;
        }
    }
};
</script>

<style></style>
