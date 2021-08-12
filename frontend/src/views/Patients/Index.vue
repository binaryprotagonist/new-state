<template>
    <v-container>
        <v-tabs fixed-tabs v-model="tab">
            <v-tab>Totes</v-tab>
            <v-tab>Actius</v-tab>
            <v-tab>Inactius</v-tab>
        </v-tabs>
        <v-skeleton-loader
            :loading="isViewLoading"
            transition="scale"
            group
            height="420"
            type="table"
        >
            <v-card>
                <v-toolbar>
                    <v-toolbar-title>Pacients</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud patients')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    small
                                    fab
                                    class="mr-2"
                                    dark
                                    v-on="on"
                                    color="primary"
                                >
                                    <v-icon dark>add</v-icon>
                                </v-btn>
                            </template>
                            <Modal
                                v-if="dialog"
                                :entities_guardianship="entities"
                                :entities_residence="entities"
                                :referents="referents"
                                :editedItem="editedItem"
                                @save="save"
                                @close="close"
                            ></Modal>
                        </v-dialog>
                        <v-dialog
                            v-model="reasonModal"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <ReasonModal
                                v-if="reasonModal"
                                :editedItem="editedItem"
                                @toggleStatus="toggleStatus(editedItem)"
                                @close="close"
                            ></ReasonModal>
                        </v-dialog>
                        <v-dialog
                            v-model="invoicesModal"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <InvoicesModal
                                v-if="invoicesModal"
                                :editedItem="editedItem"
                                @close="close"
                            ></InvoicesModal>
                        </v-dialog>
                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    @click="deleteMultiple"
                                    v-on="on"
                                    small
                                    fab
                                    color="error"
                                >
                                    <v-icon dark>delete_sweep</v-icon>
                                </v-btn>
                            </template>
                            <span>Esborrar Multiples</span>
                        </v-tooltip>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="activeItems"
                        :search="search"
                        show-select
                        v-model="selected"
                        :rowsPerPageItems="rowsPerPage"
                        ref="content"
                    >
                        <v-progress-linear
                            slot="progress"
                            color="blue darken-4"
                            indeterminate
                        ></v-progress-linear>
                        <template v-slot:item.picture="{ item }">
                            <v-avatar class="profile">
                                <v-img :src="item.picture"> </v-img>
                            </v-avatar>
                        </template>
                        <template v-slot:item.active="{ item }">
                            <v-btn
                                small
                                fab
                                depressed
                                :color="item.active == 1 ? 'success' : 'error'"
                            >
                                <v-icon color="white">{{
                                    item.active == 1 ? "check" : "close"
                                }}</v-icon>
                            </v-btn>
                        </template>
                        <template v-slot:item.action="{ item }">
                            <template v-if="$auth.check('crud patients')">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                >
                                    edit
                                </v-icon>
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="
                                        $router.push({
                                            name: 'patients_show',
                                            params: { id: item.id }
                                        })
                                    "
                                >
                                    remove_red_eye
                                </v-icon>
                                <a
                                    target="_blank"
                                    :href="`/patients/${item.id}/contract`"
                                >
                                    <v-icon class="mr-2" small>
                                        download
                                    </v-icon>
                                </a>
                                <a
                                    target="_blank"
                                    :href="`/patients/${item.id}/annexes`"
                                >
                                    <v-icon class="mr-2" small>
                                        download
                                    </v-icon>
                                </a>
                                <!-- <v-tooltip bottom>
                                    <template v-slot:activator="{ on }"> -->
                                <!--
                                            v-on="on"
                                         -->
                                <v-icon @click="openReasonModal(item)" dark
                                    >cached</v-icon
                                >

                                <v-icon
                                    @click="openInvoicesModal(item)"
                                    small
                                    lass="mr-2"
                                    >download</v-icon
                                >
                                <!-- </template> -->
                                <!-- <span>Activar/Desactivar</span> -->
                                <!-- </v-tooltip> -->
                            </template>
                             <template v-if="$auth.user().role == 'Referent economic'">
                                 <a
                                    target="_blank"
                                    :href="`/patients/${item.id}/contract`"
                                >
                                    <v-icon class="mr-2" small>
                                        download
                                    </v-icon>
                                </a>
                             </template>
                        </template>
                    </v-data-table>
                </v-card-text>
            </v-card>
        </v-skeleton-loader>
    </v-container>
</template>

<script>
import Modal from "./Modal";
import ReasonModal from "./ReasonModal";
import InvoicesModal from "./InvoicesModal";
export default {
    components: {
        Modal,
        ReasonModal,
        InvoicesModal
    },
    computed: {
        activeItems() {
            if (this.type == "all") return this.items;
            return this.items.filter(x => x.active == this.type);
        },
        // eslint-disable-next-line
        type() {
            if (this.tab == 0) {
                return "all";
            } else if (this.tab == 1) {
                return 1;
            } else if (this.tab == 2) {
                return 0;
            }
        }
    },
    data() {
        return {
            tab: 0,
            headers: [
                {
                    text: "Arxiu",
                    value: "picture"
                },
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Cognoms",
                    value: "last_name"
                },
                {
                    text: "Entitat Residència",
                    value: "residence_entity.name"
                },
                {
                    text: "Entitat Tutelar",
                    value: "guardianship_entity.name"
                },
                {
                    text: "Status",
                    value: "active"
                },
                {
                    text: "Creat",
                    value: "created_at"
                },
                {
                    text: "Accions",
                    value: "action",
                    sortable: false,
                    filtrable: false
                }
            ],
            selected: [],
            search: null,
            dialog: false,
            entities: [],
            referents: [],
            editedIndex: -1,
            items: [],
            editedItem: {},
            reasonModal: false,
            invoicesModal: false
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/patients").then(resp => {
                this.items = resp.data.map(x => {
                    return {
                        residency: ( x.residence_entity != null &&  x.residence_entity != '' ) ? x.residence_entity.id : '' ,
                        guardianship: ( x.guardianship_entity != null && x.guardianship_entity != '' ) ? x.guardianship_entity.id : '',
                        ...x
                    };
                });
                this.$store.commit("setViewLoading", false);
            });

            this.axios.get("/entities").then(resp => {
                this.entities = resp.data;
            });

            this.axios.get("/referents").then(resp => {
                this.referents = resp.data;
            });
        },

        close() {
            this.dialog = false;
            this.reasonModal = false;
            this.invoicesModal = false;
            this.editedIndex = -1;
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        openReasonModal(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.reasonModal = true;
        },
        openInvoicesModal(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.invoicesModal = true;
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            console.log(this.editedItem);
            this.dialog = true;
        },
        async save() {

            let formData = new FormData();

            for (let item in this.editedItem) {
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);
            if (this.editedIndex > -1) {
                formData.append("_method", "patch");
                this.axios
                    .post(`/patients/${this.editedItem.id}`, formData)
                    .then(resp => {
                        resp.data.guardianship = parseInt(resp.data.guardianship);
                        resp.data.residency    = parseInt(resp.data.residency);
                        Object.assign(this.items[this.editedIndex], resp.data);
                        console.log(this.items[this.editedIndex]);
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/patients", formData)
                    .then(resp => {
                        this.items.push(resp.data);
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            }
        },
        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (
                confirm(
                    `Estàs segur que vols eliminar aquest pacient? ${item.name} ${item.last_name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/patients/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot eliminar al pacient");
                    });
                // });
            }
        },
        async toggleStatus(item) {
            await this.axios.post(`patients/${item.id}/toggle`, {
                reason: item.reason
            });
            item.active = !item.active;

            this.$store.commit("showSnackbar", {
                text: "Realitzat amb èxit",
                color: "success"
            });
            this.reasonModal = false;
        },
        async toggleStatusMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Tria a l'almenys un",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                this.toggleStatus(item);
            }
        },
        async deleteMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Tria a l'almenys un",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                await this.deleteItem(item);
            }

            this.$store.commit("showSnackbar", {
                text: "Realitzat amb èxit",
                color: "success"
            });
        }
    }
};
</script>

<style></style>
