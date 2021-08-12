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
                    {{ formTitle }}
                </span>
            </v-card-title>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules="required"
                                v-model="editedItem.name"
                                label="Nom"
                            />
                        </v-col>
                        <v-col cols="12" md="6">
                            <VTextFieldWithValidation
                                rules=""
                                v-model="editedItem.description"
                                label="Descripció"
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
        }
    },
    data() {
        return {};
    },
    computed: {
        formTitle() {
            return !this.editedItem.id ? "Agregar Despesa" : "Editar Despesa";
        }
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
