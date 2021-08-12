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
                <v-col cols="12" md="8">
                    <v-card :loading="editedItem.loading" elevation="2">
                        <v-toolbar>
                            <v-toolbar-title>{{ formTitle }}</v-toolbar-title>
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
                            <v-spacer></v-spacer>
                            <a
                                target="_blank"
                                :href="`/patients/${editedItem.id}/contract`"
                            >
                                <v-btn color="primary" class="mx-2" fab>
                                    <v-icon>
                                        download
                                    </v-icon>
                                </v-btn>
                            </a>
                            <v-btn
                                @click="
                                    $router.push({
                                        name: 'patients_show_pai',
                                        params: { id: $route.params.id }
                                    })
                                "
                                color="secondary"
                                class=""
                                fab
                            >
                                <v-icon>
                                    keyboard_arrow_right
                                </v-icon>
                            </v-btn>
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
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.tis"
                                            label="N* TIS"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="situations"
                                            v-model="editedItem.situation"
                                            label="Situació jurídica"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="residence"
                                            v-model="editedItem.residence"
                                            label="Domicili"
                                            :disabled="!isEditing"
                                            outlined
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
                                            return-object
                                            v-model="editedItem.guardianship"
                                            label="Entitat"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="guardianship_economic"
                                            item-text="name"
                                            item-value="id"
                                            v-model.number="
                                                editedItem.referent_economic_guardianship_id
                                            "
                                            label="Referent econòmic"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="guardianship_social"
                                            item-text="name"
                                            item-value="id"
                                            v-model.number="
                                                editedItem.referent_social_guardianship_id
                                            "
                                            label="Referent Social"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" xs="12">
                                        <v-subheader>Residència</v-subheader>
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="entities_residence"
                                            item-text="name"
                                            item-value="id"
                                            v-model="editedItem.residency"
                                            label="Entitat"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="residence_economic"
                                            item-text="name"
                                            item-value="id"
                                            v-model.number="
                                                editedItem.referent_economic_residence_id
                                            "
                                            label="Referent Economic"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="residence_social"
                                            item-text="name"
                                            item-value="id"
                                            v-model.number="
                                                editedItem.referent_social_residence_id
                                            "
                                            label="Referent Social"
                                            :disabled="!isEditing"
                                            outlined
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
                                            v-model="editedItem.bank"
                                            label="Entitat Bancària"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.iban"
                                            label="IBAN"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.bic"
                                            label="BIC"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="4" align-self="start">
                    <v-card elevation="2" :loading="editedItem.loading">
                        <v-avatar
                            class="profile mx-auto d-block elevation-4"
                            size="180"
                        >
                            <v-img :src="editedItem.picture"></v-img>
                        </v-avatar>
                        <v-card-text>
                            <v-row align="center">
                                <v-col v-if="isEditing" cols="12" md="12">
                                    <v-file-input
                                        v-model="editedItem.file"
                                        color="deep-purple accent-4"
                                        label="Arxius"
                                        placeholder="Arxiu"
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
                                        v-model="editedItem.last_name"
                                        label="Cognoms"
                                        outlined
                                        :disabled="!isEditing"
                                    />
                                </v-col>
                                <v-col cols="12" md="12">
                                    <v-textarea
                                        label="Descripcio"
                                        v-model="editedItem.description"
                                        outlined
                                        :disabled="!isEditing"
                                    ></v-textarea>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-card>
                </v-col>

                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="`patients/${editedItem.id}/gallery`"
                        :deleteUrl="'company/delete/gallery'"
                    ></v-gallery>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>

<script>
import patientsMixin from "./patients";
import VGallery from "@/components/VGallery";
export default {
    components: {
        VGallery
    },
    mixins: [patientsMixin],
    data() {
        return {
            editedItem: {},
            patient: {},
            isEditing: false,
            referents: [],
            entities_residence: [],
            entities_guardianship: [],
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
            this.axios.get(`patients/${this.$route.params.id}`).then(resp => {
                this.editedItem = resp.data;
                this.editedItem.residency = this.editedItem.residence_entity.id;
                this.editedItem.guardianship = this.editedItem.guardianship_entity.id;

                this.patient = JSON.parse(JSON.stringify(this.editedItem));
            });

            this.axios.get("/entities").then(resp => {
                this.entities_residence = resp.data;
                this.entities_guardianship = resp.data;
            });

            this.axios.get("/referents").then(resp => {
                this.referents = resp.data;
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
                .post(`/patients/${this.editedItem.id}`, formData)
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
        }
    }
};
</script>

<style></style>
