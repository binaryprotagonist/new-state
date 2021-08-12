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
                    <v-toolbar-title>Xats</v-toolbar-title>
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
                                <v-btn
                                    small
                                    fab
                                    dark
                                    v-on="on"
                                    class="mr-2"
                                    color="primary"
                                >
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
                        <template v-slot:item.roles="{ item }">
                            <v-chip
                                small
                                color="primary"
                                class="mr-1"
                                v-for="role in item.roles"
                                :key="role + role.id"
                            >
                                {{ role.name }}
                            </v-chip>
                        </template>
                        <template v-slot:item.action="{ item }">
                            <v-icon
                                small
                                v-if="$auth.check('Administracio')"
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
                                        name: 'chats_show',
                                        params: { id: item.id }
                                    })
                                "
                            >
                                remove_red_eye
                            </v-icon>
                        </template>

                        <!-- <template slot="items" slot-scope="props">
                            <td>{{ props.item.id }}</td>
                            <td>{{ props.item.url }}</td>
                            <td>{{ props.item.name }}</td>
                            <td>{{ props.item.order }}</td>
                            <td>{{ props.item.created_at }}</td>
                            <td>
                                <v-tooltip bottom>
                                    <v-icon
                                        small
                                        slot="activator"
                                        class
                                        @click="editItem(props.item)"
                                        >edit</v-icon
                                    >
                                    <span>Editar pantalla</span>
                                </v-tooltip>
                                <v-tooltip bottom>
                                    <v-icon
                                        small
                                        slot="activator"
                                        class
                                        @click="deleteItem(props.item)"
                                        >delete</v-icon
                                    >
                                    <span>Eliminar pantalla</span>
                                </v-tooltip>
                            </td>
                        </template> -->
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
                    text: "Rols",
                    value: "roles"
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
            this.axios.get("/chats").then(resp => {
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
            });

            this.axios.get("/roles").then(resp => {
                this.roles = resp.data;
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
            this.editedItem.roles = JSON.stringify(this.editedItem.roles);

            for (let item in this.editedItem) {
                formData.append(`${item}`, this.editedItem[item]);
            }

            this.$set(this.editedItem, "loading", true);

            if (this.editedIndex > -1) {
                formData.append("_method", "patch");
                this.axios
                    .post(`/chats/${this.editedItem.id}`, formData)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/chats", formData)
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
                    .delete(`/chats/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot elimiminar al pacient");
                    });
                // });
            }
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
                await this.axios.post(`chats/${item.id}/toggle`);
                item.active = !item.active;
            }

            this.$store.commit("showSnackbar", {
                text: "Realitzat amb èxit",
                color: "success"
            });
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
