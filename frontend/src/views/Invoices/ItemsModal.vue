<template>
    <v-card>
        <v-card-title>
            <span class="headline">
                Afegir factura
            </span>
        </v-card-title>
        <v-card-text>
            <v-container>
                <v-row>
                    <v-col cols="12" md="12">
                        <v-text-field
                            v-model="title"
                            :rules="[rules.required]"
                            label="Title"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="12" md="12">
                        <v-text-field
                            v-model="quantity"
                            :rules="[rules.required]"
                            label="Quantity"
                            type="number"
                            class="washir"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="12" md="12">
                        <v-text-field
                            v-model="price"
                            :rules="[rules.required]"
                            label="Preu"
                            prefix="€"
                            type="number"
                            class="washir"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="12" md="12">
                        <v-select
                            v-model="tax"
                            :items="taxes"
                            label="Impost"
                            dense
                        ></v-select>
                    </v-col>
                </v-row>
            </v-container>
        </v-card-text>
        <v-card-actions>
            <div class="flex-grow-1"></div>
            <v-btn color="error" @click="close">Cancel·lar</v-btn>
            <v-btn color="primary" :loading="editedItem.loading" @click="save()"
                >Desa</v-btn
            >
        </v-card-actions>
    </v-card>
</template>
<script>
export default {
    props: {
        editedItem: {
            type: Object
        },
        invoice_items: {
            type: Array
        }
    },
    data: () => ({
        title: "",
        price: 0,
        quantity: 0,
        tax: 0,
        rules: {
            required: value => !!value || "Required."
        },
        taxes: ["0", "4", "10", "21"]
    }),
    methods: {
        async save() {
            let item = {
                title: this.title,
                quantity: this.quantity,
                price: this.price,
                tax: this.tax
            };
            this.invoice_items.push(item);
            this.$emit("close");
        },
        close() {
            this.$emit("close");
        },
        increment() {
            this.quantity = parseInt(this.quantity, 10) + 1;
        },
        decrement() {
            this.quantity = parseInt(this.quantity, 10) - 1;
        }
    }
};
</script>

<style scoped>
.washir {
    width: 200px;
}
</style>
