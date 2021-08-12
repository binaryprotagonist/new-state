<template>
    <v-container>
        <v-tabs fixed-tabs v-model="tab">
            <v-tab>Estat</v-tab>
            <v-tab>Banc</v-tab>
            <v-tab>Proveïdor</v-tab>
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
                    <v-toolbar-title> Proveïdor</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud providers')">
                        <v-dialog
                            v-model="dialog"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    medium
                                    small
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
                                :editedItem="editedItem"
                                :type="type"
                                @save="save"
                                @close="close"
                            ></Modal>
                        </v-dialog>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn
                                    v-on="on"
                                    @click="toggleStatusMultiple"
                                    small
                                    class="mx-3"
                                    fab
                                    color="secondary"
                                >
                                    <v-icon dark>cached</v-icon>
                                </v-btn>
                            </template>
                            <span>Activar/Desactivar</span>
                        </v-tooltip>
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
                        :headers="activeHeaders"
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
                                <v-img :src="item.picture"></v-img>
                            </v-avatar>
                        </template>
                        <template v-slot:item.active="{ item }">
                            <v-btn
                                small
                                fab
                                depressed
                                :color="item.active == 1 ? 'success' : 'error'"
                            >
                                <v-icon color="white">
                                    {{ item.active == 1 ? "check" : "close" }}
                                </v-icon>
                            </v-btn>
                        </template>
                        <template v-slot:item.action="{ item }">
                            <template v-if="$auth.check('crud providers')">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                    >edit</v-icon
                                >
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="
                                        $router.push({
                                            name: 'providers_show',
                                            params: { id: item.id }
                                        })
                                    "
                                    >remove_red_eye</v-icon
                                >
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
            tab: 0,
            "state-headers": [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Persona de contacte",
                    value: "contact_person"
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
            "bank-headers": [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Persona de contacte",
                    value: "contact_person"
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
            "provider-headers": [
                {
                    text: "Nom",
                    value: "name"
                },
                {
                    text: "Persona de contacte",
                    value: "contact_person"
                },
                {
                    text: "Metodo de Pagament",
                    value: "payment_method"
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
            editedIndex: -1,
            items: [],
            editedItem: {}
        };
    },
    created() {
        this.initialize();
    },
    computed: {
        activeHeaders() {
            return this[`${this.type}-headers`];
        },
        activeItems() {
            return this.items.filter(x => x.type == this.type);
        },
        type() {
            if (this.tab == 0) {
                return "state";
            } else if (this.tab == 1) {
                return "bank";
            } else if (this.tab == 2) {
                return "provider";
            }
        }
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/providers").then(resp => {
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
            this.$set(this.editedItem, "loading", true);
            this.$set(this.editedItem, "type", this.type);
            if (this.editedIndex > -1) {
                this.axios
                    .put(`/providers/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/providers", this.editedItem)
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
                    `Estás seguro de que deseas eliminar este proveidor? ${item.name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/providers/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No se puede eliminar el proveidor");
                    });
                // });
            }
        },
        async toggleStatusMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Elije al menos uno",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                await this.axios.post(`providers/${item.id}/toggle`);
                item.active = !item.active;
            }

            this.$store.commit("showSnackbar", {
                text: "Realizado con excito",
                color: "success"
            });
        },
        async deleteMultiple() {
            if (!this.selected.length > 0) {
                this.$store.commit("showSnackbar", {
                    text: "Elije al menos uno",
                    color: "error"
                });
                return;
            }
            let selected = this.selected;
            for (let item of selected) {
                await this.deleteItem(item);
            }

            this.$store.commit("showSnackbar", {
                text: "Realizado con excito",
                color: "success"
            });
        }
    }
};
</script>

<style></style>
