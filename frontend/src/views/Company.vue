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
            <v-row justify="center">
                <v-col cols="12" md="10" align-self="start">
                    <v-card elevation="2" :loading="editedItem.loading">
                        <template v-if="$auth.check('Administracio')">
                            <v-btn
                                v-if="!isEditing"
                                @click="isEditing = true"
                                color="primary"
                                small
                                absolute
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
                                    absolute
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
                                    absolute
                                    right
                                    fab
                                >
                                    <v-icon>
                                        close
                                    </v-icon>
                                </v-btn>
                            </template>
                        </template>
                        <v-avatar
                            class="profile mx-auto d-block elevation-4"
                            size="180"
                        >
                            <v-img
                                src="/img/sate-logo-blanco.png"
                                contain
                            ></v-img>
                        </v-avatar>
                        <v-card-text>
                            <v-row align="center" justify="center">
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.name"
                                        label="Nom"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.cif"
                                        label="CIF"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.phone"
                                        label="Telèfon"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.representative"
                                        label="Representant"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.address"
                                        label="Adreça"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required"
                                        v-model="editedItem.cp"
                                        label="CP"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <VTextFieldWithValidation
                                        rules="required|email"
                                        v-model="editedItem.email"
                                        label="Mail"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="6">
                                    <v-row align="center">
                                        <v-col cols="12" md="10">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                v-model="editedItem.map"
                                                label="Map"
                                                outlined
                                                :disabled="!isEditing"
                                            />
                                        </v-col>
                                        <v-col cols="12" md="2">
                                            <v-icon @click="openMap()"
                                                >map</v-icon
                                            >
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-card>
                </v-col>

                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="'company/gallery'"
                        :deleteUrl="'company/delete/gallery'"
                    ></v-gallery>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>

<script>
import VGallery from "../components/VGallery";
export default {
    components: {
        VGallery
    },
    data() {
        return {
            editedItem: {},
            company: {},
            isEditing: false,
            search: "",
            extended: false
        };
    },
    computed: {
        formTitle() {
            return !this.isEditing ? "Ver Pacients" : "Editar Pacients";
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios.get(`company/`).then(resp => {
                this.editedItem = resp.data;
                this.company = JSON.parse(JSON.stringify(this.editedItem));
            });
        },
        save() {
            this.$set(this.editedItem, "loading", true);
            this.axios
                .post(`/company`, this.editedItem)
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
            this.editedItem = JSON.parse(JSON.stringify(this.company));
            this.isEditing = false;
        },
        openMap() {
            window.open(
                "http://maps.google.com/maps?q=" + this.editedItem.map,
                "_blank"
            );
        },
        openClickImage() {
            console.log(this.editedItem);
        }


    }
};
</script>

<style></style>
