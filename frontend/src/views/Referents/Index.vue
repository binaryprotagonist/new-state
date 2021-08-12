<template>
    <v-container>
        <v-skeleton-loader
            :loading="isViewLoading"
            transition="scale"
            group
            height="420"
            type="table"
        >
            <v-card>
                <v-toolbar>
                    <v-toolbar-title>Referents</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud referents')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    medium
                                    fab
                                    dark
                                    v-on="on"
                                    color="primary"
                                >
                                    <v-icon dark>add</v-icon>
                                </v-btn>
                            </template>
                            <Modal
                                v-if="dialog"
                                :entities="entities"
                                :roles="roles"
                                :editedItem="editedItem"
                                @save="save"
                                @close="close"
                            >
                            </Modal>
                        </v-dialog>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="items"
                        :search="search"
                        :rowsPerPageItems="rowsPerPage"
                        ref="content"
                    >
                        <v-progress-linear
                            slot="progress"
                            color="blue darken-4"
                            indeterminate
                        ></v-progress-linear>
                        <template v-slot:item.action="{ item }">
                            <template v-if="$auth.check('crud referents')">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                >
                                    edit
                                </v-icon>
                                <v-icon small @click="deleteItem(item)">
                                    delete
                                </v-icon>
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
export default {
    components: {
        Modal
    },
    computed: {
        formTitle() {
            return this.editedIndex === -1
                ? "Agregar Referent"
                : "Editar Referent";
        }
    },
    data() {
        return {
            headers: [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Entitats",
                    value: "entity.name"
                },
                {
                    text: "Rol",
                    value: "role"
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
            search: null,
            dialog: false,
            editedIndex: -1,
            items: [],
            entities: [],
            roles: [],
            editedItem: {}
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/referents").then(resp => {
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
            });
            this.axios.get("/roles?type=referent").then(resp => {
                this.roles = resp.data;
            });
            this.axios.get("/entities").then(resp => {
                this.entities = resp.data;
            });
        },
        close() {
            this.dialog = false;
            this.editedIndex = -1;
            // requestAnimationFrame(() => {
            //     this.$refs.obs.reset();
            // });
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.dialog = true;
        },
        async save() {
            this.$set(this.editedItem, "loading", true);
            if (this.editedIndex > -1) {
                this.axios
                    .put(`/referents/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/referents", this.editedItem)
                    .then(resp => {
                        this.items.push(resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            }
        },
        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (
                confirm("Estás seguro de que deseas eliminar esta referents?")
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/referents/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No se puede eliminar la referents");
                    });
                // });
            }
        },
        remove(item) {
            this.editedItem.tags.splice(this.editedItem.tags.indexOf(item), 1);
            this.editedItem.tags = [...this.editedItem.tags];
        }
    }
};
</script>

<style></style>
