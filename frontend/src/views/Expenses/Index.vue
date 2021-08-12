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
                    <v-toolbar-title>Despeses</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('Administracio')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn small fab dark v-on="on" color="primary">
                                    <v-icon dark>add</v-icon>
                                </v-btn>
                            </template>
                            <Modal
                                v-if="dialog"
                                :editedItem="editedItem"
                                @save="save"
                                :roles="roles"
                                @close="close"
                            ></Modal>
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
                            <span>Borrar Multiples</span>
                        </v-tooltip>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="items"
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
                            <template>
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                >
                                    edit
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
    data() {
        return {
            headers: [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Descripció",
                    value: "description"
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
            editedIndex: -1,
            roles: [],
            items: [],
            editedItem: {}
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/expenses").then(resp => {
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
            });
        },

        close() {
            this.dialog = false;
            this.editedIndex = -1;
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.dialog = true;
        },
        async save() {
            let formData = new FormData();

            for (let item in this.editedItem) {
                if (!this.editedItem[item]) {
                    formData.append(`${item}`, "");
                    continue;
                }
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);
            if (this.editedIndex > -1) {
                formData.append("_method", "patch");
                this.axios
                    .post(`/expenses/${this.editedItem.id}`, formData)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/expenses", formData)
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
                confirm(
                    `Estàs segur que vols eliminar aquest pacient? ${item.name} ${item.last_name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/expenses/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot eliminar al pacient");
                    });
                // });
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
