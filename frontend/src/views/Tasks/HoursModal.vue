<template>
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
                    {{ formTitle }} de {{ activeWorker.name }}
                    {{ activeWorker.last_name }}
                </span>
            </v-card-title>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="6">
                            <v-menu
                                v-model="menu2"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                transition="scale-transition"
                                offset-y
                                min-width="290px"
                            >
                                <template v-slot:activator="{ on, attrs }">
                                    <v-text-field
                                        v-model="date_worked"
                                        label="Date"
                                        prepend-icon="mdi-calendar"
                                        readonly
                                        v-bind="attrs"
                                        v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-date-picker
                                    v-model="date_worked"
                                    @input="menu2 = false"
                                ></v-date-picker>
                            </v-menu>
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                prepend-icon="short_text"
                                label="Total Hours"
                                v-model="total_hours"
                            />
                        </v-col>
                    </v-row>
                </v-container>
            </v-card-text>
            <v-card-actions>
                <div class="flex-grow-1"></div>
                <v-btn color="error" @click="close">Cancel·lar</v-btn>
                <v-btn
                    color="primary"
                    :loading="editedItem.loading"
                    @click="save(validate)"
                    >Desa</v-btn
                >
            </v-card-actions>
        </v-card>
    </ValidationObserver>
</template>

<script>
export default {
    props: {
        editedItem: {
            type: Object
        },
        activeWorker: {
            type: Object
        }
    },
    data: () => ({
        date_worked: new Date().toISOString().substr(0, 10),
        menu2: false,
        total_hours: ""
    }),
    computed: {
        formTitle() {
            return `Agregar Hours`;
        }
    },
    created() {},
    methods: {
        async save(validate) {
            if (!(await validate())) return;

            this.axios
                .post(`/tasks/${this.editedItem.id}/hours`, {
                    task_id: this.editedItem.id,
                    worker_id: this.activeWorker.id,
                    date_worked: this.date_worked,
                    total_hours: this.total_hours
                })
                .then(resp => {
                    Object.assign(this.editedItem, resp.data);
                    this.$emit("close");
                });
        },
        close() {
            this.$emit("close");
        }
    }
};
</script>

<style></style>
