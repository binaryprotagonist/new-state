<template>
    <v-skeleton-loader
        :loading="isViewLoading"
        transition="scale"
        group
        height="420"
        type="table"
    >
        <v-card>
            <v-toolbar>
                <v-toolbar-title>Factures</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-text-field
                    append-icon="search"
                    :label="quickSearch"
                    single-line
                    v-model="search"
                    hide-details
                ></v-text-field>
                <v-spacer></v-spacer>
                <!-- v-if="$auth.check('CRUD piezas')" -->
                <v-dialog
                    v-model="dialog"
                    persistent
                    transition="dialog-bottom-transition"
                    max-width="800px"
                >
                    <template v-slot:activator="{ on }">
                        <v-btn medium small fab dark v-on="on" color="primary">
                            <v-icon dark>add</v-icon>
                        </v-btn>
                    </template>
                    <ModalInvoice
                        v-if="dialog"
                        :editedItem="editedItem"
                        :type="type"
                        @save="save"
                        @close="close"
                    ></ModalInvoice>
                </v-dialog>
            </v-toolbar>
            <v-card-text>
                <v-data-table
                    :loading="isViewLoading"
                    :headers="activeHeaders"
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
                        <v-icon small class="mr-2" @click="editItem(item)"
                            >edit</v-icon
                        >
                        <!-- <v-icon
                            small
                            class="mr-2"
                            @click="
                                $router.push({
                                    name: 'providers_show',
                                    params: { id: item.id }
                                })
                            "
                            >remove_red_eye</v-icon
                        > -->
                        <v-icon small class @click="deleteItem(item)"
                            >delete</v-icon
                        >
                    </template>
                </v-data-table>
            </v-card-text>
        </v-card>
    </v-skeleton-loader>
</template>

<script>
import ModalInvoice from "./ModalInvoice";
export default {
    components: {
        ModalInvoice
    },
    props: ["id", "type"],
    data() {
        return {
            selected: [],
            search: null,
            "provider-headers": [
                {
                    text: "Numero",
                    value: "number"
                },
                {
                    text: "Base",
                    value: "base"
                },
                {
                    text: "IVA 0%",
                    value: "iva_0"
                },
                {
                    text: "IVA 4%",
                    value: "iva_4"
                },
                {
                    text: "IVA 10%",
                    value: "iva_10"
                },
                {
                    text: "IVA 21%",
                    value: "iva_21"
                },
                {
                    text: "IRPF",
                    value: "irpf"
                },
                {
                    text: "Total",
                    value: "total"
                },
                {
                    text: "Creat",
                    value: "created_at"
                },
                {
                    text: "Inici",
                    value: "start_date"
                },
                {
                    text: "Venciment",
                    value: "due_date"
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
                    text: "Numero",
                    value: "number"
                },
                {
                    text: "Base",
                    value: "base"
                },
                {
                    text: "Interesos",
                    value: "interests"
                },
                {
                    text: "Total",
                    value: "total"
                },
                {
                    text: "Creat",
                    value: "created_at"
                },
                {
                    text: "Inici",
                    value: "start_date"
                },
                {
                    text: "Venciment",
                    value: "due_date"
                },
                {
                    text: "Accions",
                    value: "action",
                    sortable: false,
                    filtrable: false
                }
            ],
            "state-headers": [
                {
                    text: "Numero",
                    value: "number"
                },
                {
                    text: "Base",
                    value: "base"
                },
                {
                    text: "Tipus Impost",
                    value: "invoice_type"
                },
                {
                    text: "Total",
                    value: "total"
                },
                {
                    text: "Creat",
                    value: "created_at"
                },
                {
                    text: "Inici",
                    value: "start_date"
                },
                {
                    text: "Venciment",
                    value: "due_date"
                },
                {
                    text: "Accions",
                    value: "action",
                    sortable: false,
                    filtrable: false
                }
            ],
            items: [],
            editedItem: {},
            dialog: false
        };
    },
    computed: {
        activeHeaders() {
            return this[`${this.type}-headers`];
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {
            this.axios.get(`providers/${this.id}/invoices`).then(resp => {
                this.items = resp.data;
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
                    .put(
                        `/providers/${this.id}/invoices/${this.editedItem.id}`,
                        this.editedItem
                    )
                    .then(resp => {
                        Object.assign(this.items[this.editedIndex], resp.data);
                        this.close();
                    })
                    .catch(err => {
                        this.close();
                    });
            } else {
                this.axios
                    .post(`/providers/${this.id}/invoices`, this.editedItem)
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
                    `Estàs segur que vols eliminar aquest proveïdor? ${item.name}`
                )
            ) {
                // xiboapi.delete(`/library/${item.mediaId}`).then(resp => {
                this.axios
                    .delete(`/providers/${this.id}/invoices/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot elimina el proveïdor");
                    });
                // });
            }
        }
    }
};
</script>

<style></style>
