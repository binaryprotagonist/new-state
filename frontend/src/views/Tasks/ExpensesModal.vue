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
                            <VSelectWithValidation
                                rules="required"
                                :items="expenses"
                                item-text="name"
                                item-value="id"
                                v-model="expense.expense_id"
                                label="Tipus"
                            >
                            </VSelectWithValidation>
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="expense.price"
                                label="Precio"
                            ></VTextFieldWithValidation>
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
        },
        expenses: {
            type: Array
        },
        expense: {
            type: Object,
            default: () => {
                return {};
            }
        }
    },
    data() {
        return {};
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? `Agregar Despeses` : `Editar Despeses`;
        }
    },
    created() {},
    methods: {
        async save(validate) {
            if (!(await validate())) return;
            this.expense.worker_id = this.activeWorker.id;
            this.expense.task_id = this.editedItem.id;
            this.axios
                .post(`/tasks/${this.editedItem.id}/expenses`, {
                    expenses: this.expense
                })
                .then(resp => {
                     console.log(resp.data);
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
