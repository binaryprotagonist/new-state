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
                    <v-card elevation="2">
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
                                <v-btn @click="save" color="primary" small fab>
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
                                        Tancar
                                    </v-icon>
                                </v-btn>
                            </template>
                        </v-toolbar>
                        <v-card-text>
                            <v-container>
                                <v-row align="center">
                                    <v-col cols="12" md="12">
                                        <v-subheader>Entitat</v-subheader>
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.name"
                                            label="Nom"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.cif"
                                            label="CIF"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            :items="entities_types"
                                            v-model="editedItem.type"
                                            label="Tipus"
                                        >
                                        </VSelectWithValidation>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.population"
                                            label="Població"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.cp"
                                            label="CP"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.province"
                                            label="Província"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.phone"
                                            label="Telèfon"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.address"
                                            label="Adreça"
                                        />
                                    </v-col>
                                    <v-col cols="12" xs="12">
                                        <v-subheader
                                            >Àrea econòmica</v-subheader
                                        >
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.bank"
                                            label="Entitat Bancària"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.iban"
                                            label="IBAN"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            outlined
                                            :disabled="!isEditing"
                                            v-model="editedItem.bic"
                                            label="BIC"
                                        />
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="`entities/${editedItem.id}/gallery`"
                    ></v-gallery>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>

<script>
import VGallery from "@/components/VGallery";
export default {
    components: {
        VGallery
    },
    data() {
        return {
            editedItem: {},
            patient: {},
            isEditing: false,
            search: "",
            extended: false,
            roles: [],
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
            return !this.isEditing ? "Ver Entitat" : "Editar Entitat";
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios
                .get(`referents/showbyuser/${this.$auth.user().id}`)
                .then(resp => {
                    this.editedItem = resp.data.entity;
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
                .post(`/entity/${this.editedItem.id}`, formData)
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
