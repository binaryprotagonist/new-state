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
                    Assignar Treballadors
                </span>
            </v-card-title>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="12">
                            <VAutoCompleteWithValidation
                                rules="required"
                                :items="workers"
                                :item-text="v => v.name + ' ' + v.last_name"
                                item-value="id"
                                multiple
                                chips
                                small-chips
                                prepend-icon="group"
                                v-model="editedItem.workers_id"
                                label="Treballadors"
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
        workers: {
            type: Array
        }
    },
    data() {
        return {};
    },
    created() {
        this.editedItem.workers_id = this.editedItem.workers.map(x => x.id);
    },
    methods: {
        async save(validate) {
            if (!(await validate())) return;
            this.$emit("save");
        },
        close() {
            this.$emit("close");
        }
    }
};
</script>

<style></style>
