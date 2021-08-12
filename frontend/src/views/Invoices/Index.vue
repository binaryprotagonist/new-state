<template>
    <v-container>
        <v-tabs fixed-tabs v-model="tab">
            <v-tab>Totes</v-tab>
            <v-tab>Pagades</v-tab>
            <v-tab>No Pagades</v-tab>
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
                    <template>
                         <v-btn
                            small
                            fab
                            class="mr-2"
                            dark
                            @click="$router.push({ name: 'invoices.create' })"
                            color="primary"
                        >
                          <v-icon dark>add</v-icon>
                         </v-btn>
                         <v-btn
                            small
                            fab
                            class="mr-2"
                            dark
                            @click="exportExcel=true"
                            color="primary"
                         >
                            <v-icon dark>download</v-icon>
                         </v-btn>
                    </template>
                      <template>
                          <v-dialog
                            v-model="exportExcel"
                            persistent
                            transition="dialog-bottom-transition"
                            max-width="800px"
                        >
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
                                            Exporta
                                        </span>
                                        <hr />
                                    </v-card-title>
                                    <v-card-text>
                                        <v-container>
                                            <v-row>
                                                <v-col cols="4" md="4">
                                                        <VAutoCompleteWithValidation
                                                        rules="required"
                                                        :items="patients"
                                                        :item-text="v => v.name + ' ' + v.last_name"
                                                        item-value="id"
                                                        chips
                                                        small-chips
                                                        prepend-icon="person"
                                                        v-model="patientId"
                                                        label="Usuari"
                                                        />
                                                </v-col>
                                                <v-col cols="12" md="4">
                                                        <VAutoCompleteWithValidation
                                                        rules="required"
                                                        :items="months"
                                                        item-text="name"
                                                        item-value="value"
                                                        v-model="month"
                                                        label="Month"
                                                        />
                                                </v-col>
                                                <v-col cols="12" md="4">
                                                        <VAutoCompleteWithValidation
                                                        rules="required"
                                                        :items="years"
                                                        item-text="name"
                                                        item-value="value"
                                                        v-model="year"
                                                        label="Year"
                                                        />
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-card-text>
                                    <v-card-actions>
                                        <div class="flex-grow-1"></div>
                                        <v-btn color="error" @click="exportExcel=false"
                                            >Cancel·lar</v-btn
                                        >
                                        <v-btn
                                            color="primary"
                                            :loading="editedItem.loading"
                                            @click="exportHours"
                                            >Export</v-btn
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
                                <v-icon  v-if="$auth.user().role != 'Referent economic'"
                                    small
                                    class="mr-2"
                                    @click="editItem(item)"
                                >
                                    edit
                                </v-icon>
                                <v-icon small @click="deleteItem(item)"  v-if="$auth.user().role != 'Referent economic'">
                                    delete
                                </v-icon>
                                <a
                                    target="_blank"
                                    :href="`/patient_invoices/${item.id}/pdf`"
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
                    text: "Factura",
                    value: "title"
                },
                {
                    text: "Data Creació",
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
            excelDialog : false,
            exportExcel:false,
            editedItem: {},
            patients:[],
            month: null,
            patientId : null,
            year: null,
            months : [
                {'name':'Jan','value':'1'},
                {'name':'Feb','value':'2'},
                {'name':'Mar','value':'3'},
                {'name':'Apr','value':'4'},
                {'name':'May','value':'5'},
                {'name':'Jun','value':'6'},
                {'name':'Jul','value':'7'},
                {'name':'Aug','value':'8'},
                {'name':'Sept','value':'9'},
                {'name':'Oct','value':'10'},
                {'name':'Nov','value':'11'},
                {'name':'Dec','value':'12'}
            ],
            years : [
                {'name':'2017','value':'2017'},
                {'name':'2018','value':'2018'},
                {'name':'2019','value':'2019'},
                {'name':'2020','value':'2020'},
                {'name':'2021','value':'2021'}
            ]
        };
    },
    created() {
        this.initialize();
    },
    methods: {
        initialize() {

            this.axios.get("patients").then(resp => {
                this.patients = resp.data;
            });

            this.$store.commit("setViewLoading", true);
            this.axios.get("/patient_invoices").then(resp => {
                console.log(resp.data);
                this.items = resp.data.map(x => {
                    return {
                        ...x
                    };
                });

                this.$store.commit("setViewLoading", false);
            });
        },

        editItem(item) {
            this.$router.push("/invoices/" + item.id);
        },

        exportHours(){
            if(this.patientId != null && this.month != null && this.year != null)
               window.location.href = `/invoice/excel/export?patient_id=${this.patientId}&month=${this.month}&year=${this.year}`;
        },

        deleteItem(item) {
            const index = this.items.indexOf(item);
            if (confirm("Aquestes segur que vols eliminar aquesta Factura?")) {
                this.axios
                    .delete(`/patient_invoices/${item.id}`)
                    .then(() => {
                        this.items.splice(index, 1);
                    })
                    .catch(() => {
                        alert("No es pot eliminar la factura");
                    });
            }
        }
    }
};
</script>
