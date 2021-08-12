<template>
    <v-container>
        <v-card>
            <v-card-title>
                <span class="headline">
                    Factures
                </span>
            </v-card-title>
            <v-card-text>
                <v-data-table
                    :loading="isViewLoading"
                    :headers="headers"
                    :items="getInvoices"
                    :rowsPerPageItems="rowsPerPage"
                    ref="content"
                >
                    <v-progress-linear
                        slot="progress"
                        color="blue darken-4"
                        indeterminate
                    ></v-progress-linear>
                    <template v-slot:item.action="{ item }">
                        <template v-if="$auth.check('crud patients')">
                            <a
                                target="_blank"
                                :href="`/patient_invoices/${item.id}/pdf`"
                            >
                                <v-icon class="mr-2" small>
                                    remove_red_eye
                                </v-icon>
                            </a>
                        </template>
                    </template>
                </v-data-table>
            </v-card-text>
            <v-card-actions>
                <div class="flex-grow-1"></div>
                <v-btn color="error" @click="close">Cancel·lar</v-btn>
            </v-card-actions>
        </v-card>
    </v-container>
</template>
<script>
export default {
    props: {
        editedItem: {
            type: Object
        }
    },
    created() {
        this.initialize();
    },
    computed: {
        getInvoices() {
            return this.items;
        }
    },
    data() {
        return {
            headers: [
                {
                    text: "Invoice",
                    value: "due_date"
                },
                {
                    text: "Accions",
                    value: "action",
                    sortable: false,
                    filtrable: false
                }
            ],
            selected: [],
            items: []
        };
    },
    methods: {
        close() {
            this.$emit("close");
        },
        initialize() {
            this.items = this.editedItem.patient_invoices;
        }
    }
};
</script>
