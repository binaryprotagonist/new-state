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
                    <v-toolbar>
                        <v-toolbar-title>
                            <v-icon @click="$router.push({ name: 'invoices' })"
                                >chevron_left</v-icon
                            >
                            {{ formTitle }}</v-toolbar-title
                        >
                        <v-spacer></v-spacer>
                        <v-btn
                            v-if="isEditing"
                            @click="isEditing = true"
                            color="primary"
                            small
                            fab
                        >
                            <v-icon>
                                Editar
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
                                    Guardar
                                </v-icon>
                            </v-btn>
                        </template>
                    </v-toolbar>
                </v-col>

                <v-col cols="12" md="12">
                    <v-card :loading="editedItem.loading" elevation="2">
                        <v-card-text>
                            <v-container>
                                <v-row>
                                    <v-col cols="12" md="8">
                                        <VAutoCompleteWithValidation
                                            rules="required"
                                            :items="patients"
                                            :item-text="
                                                v => v.name + ' ' + v.last_name
                                            "
                                            item-value="id"
                                            prepend-icon="person"
                                            v-model="editedItem.patient_id"
                                            label="Usuari"
                                            :disabled="true"
                                            outlined
                                        />
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <v-dialog
                                            v-model="dialog"
                                            persistent
                                            transition="dialog-bottom-transition"
                                            max-width="600px"
                                        >
                                            <template v-slot:activator="{ on }">
                                                <v-btn
                                                    medium
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
                                            <ItemsModal
                                                v-if="dialog"
                                                :editedItem="editedItem"
                                                :activeWorker="activeWorker"
                                                :invoice_items="invoice_items"
                                                @save="save"
                                                @close="closeDialog"
                                            ></ItemsModal>
                                        </v-dialog>
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <v-simple-table>
                                            <template v-slot:default>
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">
                                                            Item
                                                        </th>
                                                        <th class="text-left">
                                                            Quantitat
                                                        </th>
                                                        <th class="text-left">
                                                            Preu
                                                        </th>
                                                        <th class="text-left">
                                                            Impostos
                                                        </th>
                                                        <th class="text-left">
                                                            Total
                                                        </th>
                                                        <th class="text-left">
                                                            Opcions
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr
                                                        v-for="item in invoice_items"
                                                        :key="item.title"
                                                    >
                                                        <td>
                                                            {{ item.title }}
                                                        </td>
                                                        <td>
                                                            {{ item.quantity }}
                                                        </td>
                                                        <td>
                                                            {{ item.price }}€
                                                        </td>
                                                        <td>{{ item.tax }}</td>
                                                        <td>
                                                            {{
                                                                item.quantity *
                                                                    item.price
                                                            }}€
                                                        </td>
                                                        <td>
                                                            <v-icon
                                                                small
                                                                @click="
                                                                    deleteItem(
                                                                        item
                                                                    )
                                                                "
                                                            >
                                                                Borrar
                                                            </v-icon>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </template>
                                        </v-simple-table>
                                    </v-col>
                                    <v-col cols="12" md="12">
                                        <v-textarea
                                            v-model="editedItem.summary"
                                            label="Resum"
                                            filled
                                        ></v-textarea>
                                    </v-col>
                                    <v-col cols="12" md="4">
                                        <v-select
                                            v-model="status"
                                            :items="status_paid"
                                            label="Status"
                                            dense
                                        ></v-select>
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
        </ValidationObserver>
    </v-container>
</template>
<script>
import ItemsModal from "./ItemsModal";

export default {
    components: {
        ItemsModal
    },
    data() {
        return {
            isEditing: false,
            patients: [],
            editedItem: {},
            invoice_items: [],
            total_invoice: 0,
            dialog: false,
            activeWorker: {},
            status_paid: ["pagado", "no pagado"],
            status: "no pagado"
        };
    },
    computed: {
        formTitle() {
            return "Editar Factura";
        }
    },
    created() {
        this.initialize();
    },

    methods: {
        initialize() {
            this.axios.get("patients").then(resp => {
                this.patients = resp.data;
            });

            this.axios
                .get(`/patient_invoices/${this.$route.params.id}`)
                .then(resp => {
                    this.invoice_items = resp.data.patient_invoice_items.map(
                        x => {
                            return {
                                title: x.title,
                                quantity: x.quantity,
                                price: x.price,
                                tax: x.tax
                            };
                        }
                    );

                    this.editedItem.patient_id = resp.data.patient_id;

                    this.get_total_invoice();
                });
        },

        get_total_invoice() {
            this.total_invoice = 0;

            this.invoice_items.forEach(el => {
                this.total_invoice =
                    this.total_invoice + el.quantity * el.price;
            });
        },

        save() {
            this.$set(this.editedItem, "loading", true);

            this.axios
                .put(`/patient_invoices/${this.$route.params.id}`, {
                    items: this.invoice_items,
                    summary: this.editedItem.summary,
                    paid: this.status
                })
                .then(() => {
                    this.$router.push("/invoices");
                })
                .catch(() => {
                    // console.log(err);
                });
        },
        cancel() {
            this.editedItem = JSON.parse(JSON.stringify(this.invoice_items));
            this.isEditing = false;
        },
        closeDialog() {
            this.get_total_invoice();
            this.dialog = false;
        }
    }
};
</script>
