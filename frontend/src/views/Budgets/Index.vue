<template>
    <v-container>
        <v-tabs fixed-tabs v-model="tab">
            <v-tab>Totes</v-tab>
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
                    <v-toolbar-title>Pressupost</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-text-field
                        append-icon="search"
                        :label="quickSearch"
                        single-line
                        v-model="search"
                        hide-details
                    ></v-text-field>
                    <v-spacer></v-spacer>
                    <template>
                        <v-btn
                            small
                            fab
                            class="mr-2"
                            dark
                            @click="$router.push({ name: 'budget.create' })"
                            color="primary"
                        >
                            <v-icon dark>add</v-icon>
                        </v-btn>
                    </template>
                </v-toolbar>
                <v-card-text>
                    <v-data-table
                        :loading="isViewLoading"
                        :headers="headers"
                        :items="activeItems"
                        :search="search"
                        :rowsPerPAgeItems="rowsPerPage"
                        ref="content"
                    >
                        <v-progress-linear
                            slot="progress"
                            color="blue darken-4"
                            indeterminate
                        ></v-progress-linear>

                        <template v-slot:item.action="{ item }">
                            <template>
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
                                <a
                                    target="_blank"
                                    :href="`/patient_budgets/${item.id}/pdf`"
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
export default {
    components: {},
    computed: {
        activeItems() {
            if (this.type == "all") return this.items;
            return this.items.filter(x => x.paid == this.type);
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
                    text: "Pressupost",
                    value: "title"
                },
                {
                    text: "Data de creació",
                    value: "due_date"
                },
                {
                    text: "Descripció",
                    value: "description"
                },
                {
                    text: "Total",
                    value: "total"
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
    methods: {
        initialize() {
            this.$store.commit("setViewLoading", true);
            this.axios.get("/patient_budgets").then(resp => {
                this.items = resp.data.map(x => {
                    return {
                        ...x
                    };
                });
                this.$store.commit("setViewLoading", false);
            });
        },

        editItem(item) {
            this.$router.push("/budgets/" + item.id);
        },

        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (confirm("Estas seguro que deseas eliminar esta Factura?")) {
                this.axios
                    .delete(`/patient_budgets/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No se puede eliminar la factura");
                    });
            }
        }
    }
};
</script>
