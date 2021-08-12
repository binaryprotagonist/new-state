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
                    <v-toolbar-title>Rols</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template v-if="$auth.check('crud roles')">
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
                                                <v-col cols="12" md="12">
                                                    <VTextFieldWithValidation
                                                        rules="required"
                                                        v-model="
                                                            editedItem.name
                                                        "
                                                        label="Nom"
                                                    />
                                                </v-col>
                                                <template
                                                    v-for="permission in permissions"
                                                >
                                                    <v-col
                                                        :key="permission.type"
                                                        cols="12"
                                                        xs="12"
                                                    >
                                                        <v-subheader>{{
                                                            permission.type
                                                        }}</v-subheader>
                                                    </v-col>
                                                    <v-col
                                                        :key="name"
                                                        cols="12"
                                                        md="6"
                                                        xs="6"
                                                        v-for="name in permission.permissions"
                                                    >
                                                        <v-checkbox
                                                            v-model="
                                                                editedItem.permission
                                                            "
                                                            class="text-capitalize"
                                                            :value="name.value"
                                                            :label="
                                                                `${name.text}`
                                                            "
                                                        ></v-checkbox>
                                                    </v-col>
                                                </template>
                                                <v-col cols="12" xs="12">
                                                    <v-subheader>
                                                        Tipus</v-subheader
                                                    >
                                                </v-col>
                                                <v-col cols="12" md="4" xs="4">
                                                    <v-switch
                                                        v-model="
                                                            editedItem.show
                                                        "
                                                        value="referent"
                                                        label="Referent"
                                                    ></v-switch>
                                                </v-col>
                                                <v-col cols="12" md="4" xs="4">
                                                    <v-switch
                                                        v-model="
                                                            editedItem.show
                                                        "
                                                        value="treballador"
                                                        label="Treballador"
                                                    ></v-switch>
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
                            <template v-if="$auth.check('crud roles')">
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
// eslint-disable-next-line
import _ from "lodash";
export default {
    computed: {
        formTitle() {
            return this.editedIndex === -1 ? "Agregar Rol" : "Editar Rol";
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
                    text: "Tipus",
                    value: "show"
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
            editedItem: { permission: [] },
            defaultItem: { permission: [] },
            permissions: [
                {
                    type: "Pacients",
                    permissions: [
                        { value: "read patients", text: "ver pacients" },
                        { value: "crud patients", text: "modificar pacients" }
                    ]
                },
                {
                    type: "Entitats",
                    permissions: [
                        { value: "read entities", text: "ver entitats" },
                        { value: "crud entities", text: "modificar entitats" }
                    ]
                },
                {
                    type: "Roles",
                    permissions: [
                        { value: "read roles", text: "ver rol" },
                        { value: "crud roles", text: "modificar rol" }
                    ]
                },
                {
                    type: "Proveïdors",
                    permissions: [
                        { value: "read providers", text: "ver proveidor" },
                        { value: "crud providers", text: "modificar proveidor" }
                    ]
                },
                {
                    type: "Tasques",
                    permissions: [
                        { value: "read tasks", text: "ver tàsques " },
                        { value: "crud tasks", text: "acció tàsques " }
                    ]
                },
                {
                    type: "Referents",
                    permissions: [
                        { value: "read referents", text: "ver referents" },
                        { value: "crud referents", text: "acció referents" }
                    ]
                },
                {
                    type: "Patient Invoices",
                    permissions: [
                        {
                            value: "read patient_invoices",
                            text: "ver Patient Invoices"
                        },
                        {
                            value: "crud patient_invoices",
                            text: "acció Patient invoices"
                        }
                    ]
                }
            ]
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/roles").then(resp => {
                if (this.$auth.user().role == "Administracio") {
                    this.items = resp.data;
                } else if (this.$auth.user().role == "admin") {
                    this.items = resp.data.filter(x => {
                        return !x.name.includes("Administracio");
                    });
                } else {
                    this.items = resp.data.filter(x => {
                        return (
                            !x.name.includes("Administracio") &&
                            !x.name.includes("admin")
                        );
                    });
                }
                this.$store.commit("setViewLoading", false);
            });
            // this.axios.get("/permissions").then(resp => {
            //     this.permissions = resp.data
            // });
        },
        close() {
            this.dialog = false;
            this.editedIndex = -1;
            requestAnimationFrame(() => {
                this.$refs.obs.reset();
            });
            this.$set(this.editedItem, "loading", false);
            this.editedItem = JSON.parse(JSON.stringify(this.defaultItem));
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
                    .put(`/roles/${this.editedItem.id}`, this.editedItem)
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(() => {
                        this.close();
                    });
            } else {
                this.axios
                    .post("/roles", this.editedItem)
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
            if (confirm("Estás seguro de que deseas eliminar esta rol?")) {
                this.axios
                    .delete(`/roles/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No se puede eliminar la rol");
                    });
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
