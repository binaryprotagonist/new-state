<template>
    <v-container>
        <v-toolbar>
            <v-toolbar-title>
                <span class="heading-2">
                    <v-btn
                        small
                        fab
                        depressed
                        @click="
                            $router.push({
                                name: 'patients_show',
                                params: { id: $route.params.id }
                            })
                        "
                    >
                        <v-icon>keyboard_arrow_left</v-icon>
                    </v-btn>

                    {{ patient.name }} {{ patient.last_name }}</span
                ></v-toolbar-title
            >
            <v-spacer> </v-spacer>

             <a
                :href="`/patients/${$route.params.id}/pai/contract`"
                target="_blank"
            >
                <v-btn color="primary" class="ml-2" fab>
                    <v-icon>
                        download
                    </v-icon>
                </v-btn>
            </a>

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
                <v-btn class="ml-2" @click="cancel" color="error" small fab>
                    <v-icon>
                        close
                    </v-icon>
                </v-btn>
            </template>
        </v-toolbar>
        <masonry :cols="2" :gutter="30">
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea Física
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.background"
                                label="Antecedents Personals"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.hypertension"
                                label="Hipertensió"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.diabetes"
                                label="Diabetis"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.diagnostics"
                                label="Diagnòstics"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.surgical_interventions"
                                label="Intervencios Quirúrgiques"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.allergies"
                                label="Al-lèrgies"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.treatment"
                                label="Tractament"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.medication"
                                label="Presa de Medicació"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.can_express"
                                label="Sap expresar el que li passa al metge"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.medication_complimentary"
                                label="Complient del tractament mèdic"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Hàbits de vida
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.diet"
                                label="Dieta Habitual"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.toxics"
                                label="Consum de tòxics"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.exercise"
                                label="Exercici fìsic"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>

            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Hàbits Aspecte Físic
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.care_aspect"
                                label="Cura de l´aspecte físic"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.hygiene"
                                label="Higiene Personal"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>

            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Mobilitat
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.roaming"
                                label="Deambulació"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.support"
                                label="Algun tipus de suport?"
                                hint="bastons, muletes, caminadors, cadira de rodes"
                                persistent-hint
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>

            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Activitats de la vida diaria
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.recognizes"
                                label="Les reconeix"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.daily_hygiene"
                                label="Higiene personal"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.dress_up"
                                label="Vestir-se"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.bathroom"
                                label="Anar al bany"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.food"
                                label="Menjar"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>

            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Instrumentals
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.buy"
                                label="Comprar"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.cook"
                                label="Cuinar"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.clean_up"
                                label="Neteja"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.new_tech"
                                label="Utilizació de noves tecnologies"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>

            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Avançades
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.hobbies"
                                label="Gustos i aficions"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.religious"
                                label="Polítiques i / o religioses"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.interests"
                                label="Interessos"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea Cognitiva
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.orientation"
                                label="Orientació temporal i espacial"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.short"
                                label="A Curt termini"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.long"
                                label="A llarg termini"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.storm"
                                label="Temporal"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.recognizes_friends"
                                label="Reconeixement de familiars i amics"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.self_concept"
                                label="Autoconcepte"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.language"
                                label="Llenguatge"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.compression"
                                label="Compresió"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.behavior"
                                label="Trastorn de la conducta:"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.delusions"
                                label="Deliris"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.hallucinations"
                                label="Al lucinacions"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea Afectiva
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.mood"
                                label="Estat anímic habitual"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.shows_emotions"
                                label="Expressa el seu estat emocional"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.manage_emotions"
                                label="Gestiona les seves emocions"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.manage_issues"
                                label="Sap gestionar les emcions alienes"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.curiosity"
                                label="Signes d´ansietat"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.somatic"
                                label="Queixes somàtiques"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea de D´Inclusió Social I Relacions Interpersonals
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.social_relations"
                                label="Relacions socials"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.family"
                                label="Relacions familiars"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.activities"
                                label="Participació en diferents activitats"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.transportation"
                                label="Ús de transports"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.inappropriate"
                                label="Comportament social inadequat"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.aggressiveness"
                                label="Agressivitat física o verbal"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea de D´Autodeterminció
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.spare_time"
                                label="Proposa activitats per al seu temps lliure"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.personal_satisfaction"
                                label="Busca la seva satisfacció personal"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.schedules"
                                label="Pren decisions sobre la organització dels seus horaris"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.alternative_activities"
                                label="Busca alternatives a activitats que no el satisfan"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.autonomous"
                                label="És autònom al seu dia a dia"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.goals"
                                label="Facilitats per assolir els seus propis objectius"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                v-model="editedItem.objects"
                                label="Capacitat per establir els seus propis objectus"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Àrea Econòmica
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="12">
                            <VTextFieldWithValidation
                                v-model="editedItem.provision"
                                label="Disposició d´economia"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Aspectes a treballar
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="12">
                            <v-textarea
                                v-model="editedItem.to_work"
                                label="Disposició d´economia"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Seguiment pla d´atenció personalizat:
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="12">
                            <v-textarea
                                v-model="editedItem.follow_up"
                                label="Disposició d´economia"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
            <div></div>
            <v-card class="my-4" :loading="editedItem.loading">
                <v-card-title>
                    <v-toolbar flat>
                        Observació
                    </v-toolbar>
                </v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" md="12">
                            <v-textarea
                                v-model="editedItem.observation"
                                label="Disposició d´economia"
                                outlined
                                :disabled="!isEditing"
                            />
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
        </masonry>
    </v-container>
</template>

<script>
export default {
    components: {},
    data() {
        return {
            editedItem: {},
            editedItemBackup: {},
            patient: {},
            isEditing: false
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios.get(`patients/${this.$route.params.id}`).then(resp => {
                this.patient = resp.data;
            });
            this.axios
                .get(`patients/${this.$route.params.id}/pai`)
                .then(resp => {
                    this.editedItem = resp.data;
                    this.editedItemBackup = JSON.parse(
                        JSON.stringify(this.editedItem)
                    );
                });
        },
        save() {
            this.$set(this.editedItem, "loading", true);
            this.axios
                .put(`/patients/${this.editedItem.id}/pai`, this.editedItem)
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
            this.editedItem = JSON.parse(JSON.stringify(this.editedItemBackup));
            this.isEditing = false;
        }
    }
};
</script>

<style></style>
