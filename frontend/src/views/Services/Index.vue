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
                    <v-toolbar-title>Serveis</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud entities')">
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
                            <ValidationObserver
                                ref="obs"
                                v-slot="{
                                    invalid,
                                    validated,
                                    passes,
                                    validate
                                }"
                            >
                                <v-card>
                                    <v-card-title>
                                        <span class="headline">
                                            {{ formTitle }}
                                        </span>
                                        <hr />
                                    </v-card-title>
                                    <v-card-text>
                                        <v-container>
                                            <v-row>
                                                <v-col cols="12" md="8">
                                                    <VTextFieldWithValidation
                                                        rules="required"
                                                        v-model="
                                                            editedItem.name
                                                        "
                                                        label="Servei"
                                                    />
                                                </v-col>
                                                <v-col cols="12" md="4">
                                                    <VTextFieldWithValidation
                                                        rules="required"
                                                        v-model="editedItem.cost_per_hour"
                                                        label="Preu hora"
                                                    />
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-card-text>
                                    <v-card-actions>
                                        <div class="flex-grow-1"></div>
                                        <v-btn color="error" @click="close"
                                            >Cancel·lar</v-btn
                                        >
                                        <v-btn
                                            color="primary"
                                            :loading="editedItem.loading"
                                            @click="save(validate)"
                                            >Desa</v-btn
                                        >
                                    </v-card-actions>
                                </v-card>
                            </ValidationObserver>
                        </v-dialog>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="activeItems"
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
                            <template v-if="$auth.check('crud entities')">
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
export default {
    computed: {
        formTitle() {
            return this.editedIndex === -1
                ? "Afegir Serveis"
                : "Editar Serveis";
        },
        activeItems() {
            if (this.type == "all") return this.items;
            return this.items.filter(x => x.type == this.type);
        },
        type() {
            if (this.tab == 0) {
                return "all";
            }
        }
    },
    data() {
        return {
            tab: 0,
            headers: [
                {
                    text: "Servei",
                    value: "name"
                },
                {
                    text: "Preu hora",
                    value: "cost_per_hour"
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
            editedItem: {},
        };
    },

    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/services").then(resp => {
                this.items = resp.data;
                this.$store.commit("setViewLoading", false);
            });
        },
        close() {
            this.dialog = false;
            this.editedIndex = -1;
            requestAnimationFrame(() => {
                this.$refs.obs.reset();
            });
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify({}));
        },
        editItem(item) {
            this.editedIndex = this.items.indexOf(item);
            this.editedItem = JSON.parse(JSON.stringify(item));
            this.dialog = true;
        },
        async save(validate) {
            if (!(await validate())) return;

            this.$set(this.editedItem, "loading", true);
            if (this.editedIndex > -1) {
                this.axios
                    .put(`/services/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/services", this.editedItem)
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
            if (confirm("Estás seguro de que deseas eliminar esta entidad?")) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/services/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot eliminar l'entitat");
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
