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
                                    @click="$router.push({ name: 'workers' })"
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
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.name"
                                            label="Nom"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.last_name"
                                            label="Cognoms"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VSelectWithValidation
                                            rules="required"
                                            :items="roles"
                                            item-text="name"
                                            item-value="id"
                                            v-model="editedItem.role_id"
                                            label="Tipus"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.dni"
                                            label="DNI"
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
                                            rules=""
                                            v-model="editedItem.mobil"
                                            label="Mòbil"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
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
                                                @input="
                                                    editedItem.birth_date_menu = false
                                                "
                                            ></v-date-picker>
                                        </v-menu>
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
                                    <v-col cols="12" md="6">
                                        <VTextFieldWithValidation
                                            rules="required|email"
                                            v-model="editedItem.company_email"
                                            label="Mail dempresa"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            v-model="editedItem.address"
                                            label="Adreça"
                                            :disabled="!isEditing"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <v-subheader
                                            >Dates Bancaries</v-subheader
                                        >
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="editedItem.banking_entity"
                                            label="Entitat Bancaria"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="editedItem.iban"
                                            label="IBAN"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="editedItem.bic"
                                            label="BIC"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-row>
                                            <v-col cols="12" md="8">
                                                <v-subheader
                                                    >Formació
                                                    acadèmica</v-subheader
                                                >
                                            </v-col>
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
                                                <v-row>
                                                    <v-col cols="12" md="8">
                                                        <VTextFieldWithValidation
                                                            rules="required"
                                                            :disabled="
                                                                !isEditing
                                                            "
                                                            outlined
                                                            v-model.lazy="
                                                                editedItem
                                                                    .academic_training[
                                                                    index
                                                                ]
                                                            "
                                                            label="BIC"
                                                        />
                                                    </v-col>
                                                    <v-col cols="12" md="4">
                                                        <v-btn
                                                            @click="
                                                                removeAcademic(
                                                                    index
                                                                )
                                                            "
                                                            class="ml-2"
                                                            small
                                                            color="error"
                                                            fab
                                                        >
                                                            <v-icon
                                                                >close</v-icon
                                                            >
                                                        </v-btn>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col cols="12" md="6">
                                        <v-row>
                                            <v-col cols="12" md="8">
                                                <v-subheader
                                                    >Experiència
                                                    Laboral</v-subheader
                                                >
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
                                                <v-row>
                                                    <v-col cols="12" md="8">
                                                        <VTextFieldWithValidation
                                                            rules="required"
                                                            :disabled="
                                                                !isEditing
                                                            "
                                                            outlined
                                                            v-model.lazy="
                                                                editedItem
                                                                    .work_experience[
                                                                    index
                                                                ]
                                                            "
                                                            label="Experiència"
                                                        />
                                                    </v-col>
                                                    <v-col cols="12" md="4">
                                                        <v-btn
                                                            @click="
                                                                removeExperience(
                                                                    index
                                                                )
                                                            "
                                                            class="ml-2"
                                                            small
                                                            color="error"
                                                            fab
                                                        >
                                                            <v-icon
                                                                >close</v-icon
                                                            >
                                                        </v-btn>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-col>

                                    <v-col cols="12" xs="12">
                                        <v-subheader
                                            >Tipus de contracte</v-subheader
                                        >
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="
                                                editedItem.type_of_contract
                                            "
                                            label="Tipus de contracte"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="editedItem.working_day"
                                            label="Jornada"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <v-menu
                                            v-model="
                                                editedItem.initial_date_menu
                                            "
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
                                                        editedItem.initial_date
                                                    "
                                                    label="Data d´inici"
                                                    prepend-icon="event"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker
                                                v-model="
                                                    editedItem.initial_date
                                                "
                                                @input="
                                                    editedItem.initial_date_menu = false
                                                "
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <v-menu
                                            v-model="
                                                editedItem.renewal_date_menu
                                            "
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
                                                        editedItem.renewal_date
                                                    "
                                                    label="Data de renovació"
                                                    prepend-icon="event"
                                                    readonly
                                                    v-on="on"
                                                    :disabled="!isEditing"
                                                    outlined
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker
                                                v-model="
                                                    editedItem.renewal_date
                                                "
                                                @input="
                                                    editedItem.renewal_date_menu = false
                                                "
                                            ></v-date-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
                                            v-model="
                                                editedItem.contract_duration
                                            "
                                            label="Duració del contracte"
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <VTextFieldWithValidation
                                            rules="required"
                                            :disabled="!isEditing"
                                            outlined
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
                                                :disabled="!isEditing"
                                                outlined
                                                v-model="editedItem.import"
                                                label="Import Brut"
                                            />
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                :disabled="!isEditing"
                                                outlined
                                                v-model="editedItem.irpf"
                                                label="IRPF"
                                            />
                                        </v-col>
                                        <v-col cols="12" md="4">
                                            <VTextFieldWithValidation
                                                rules="required"
                                                :disabled="!isEditing"
                                                outlined
                                                v-model="
                                                    editedItem.total_import
                                                "
                                                label="Import Total"
                                            />
                                        </v-col>
                                    </template>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="12">
                    <v-gallery
                        :editedItem="editedItem"
                        :saveUrl="`workers/${editedItem.id}/gallery`"
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
            roles: []
        };
    },
    computed: {
        formTitle() {
            return !this.isEditing ? "Ver Treballadors" : "Editar Treballadors";
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios.get(`workers/${this.$route.params.id}`).then(resp => {
                this.editedItem = resp.data;
                this.patient = JSON.parse(JSON.stringify(this.editedItem));
            });

            this.axios.get("/roles?type=Treballador").then(resp => {
                this.roles = resp.data;
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
                .post(`/workers/${this.editedItem.id}`, formData)
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
        addAcademic() {
            if (!this.editedItem.academic_training)
                this.$set(this.editedItem, "academic_training", []);
            this.editedItem.academic_training.push("");
        },
        addExperience() {
            if (!this.editedItem.work_experience)
                this.$set(this.editedItem, "work_experience", []);
            this.editedItem.work_experience.push("");
        },
        cancel() {
            this.editedItem = JSON.parse(JSON.stringify(this.patient));
            this.isEditing = false;
        }
    }
};
</script>

<style></style>
