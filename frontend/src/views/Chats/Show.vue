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
            <v-card class="elevation-12">
                <v-toolbar>
                    <v-toolbar-title>{{ chat.name ? chat.name : '' }}</v-toolbar-title>
                </v-toolbar>
                <v-card-text class="bg-red">
                    <v-list ref="chat" id="logs">
                        <template v-for="(item, index) in messages">
                            <v-subheader v-if="item" :key="index"
                                ><v-chip class="mr-2" color="primary" small>{{
                                    item.user ? item.user.name : ''
                                }}</v-chip>
                                {{ item.text }}</v-subheader
                            >
                        </template>
                    </v-list>
                </v-card-text>
                <v-card-actions class="align-start">
                    <v-container wrap>
                        <v-layout justify-space-between="">
                            <v-flex xs11>
                                <VTextFieldWithValidation
                                    rules="required"
                                    v-model="message"
                                    @keydown.enter="submit(validate)"
                                    outlined
                                    label="Message"
                                ></VTextFieldWithValidation>
                            </v-flex>
                            <v-flex xs1>
                                <v-btn
                                    @click="submit(validate)"
                                    fab
                                    dark
                                    small
                                    type="submit"
                                >
                                    <v-icon dark>send</v-icon>
                                </v-btn>
                            </v-flex>
                        </v-layout>
                    </v-container>
                </v-card-actions>
            </v-card>
        </ValidationObserver>
    </v-container>
</template>

<script>
export default {
    data() {
        return {
            message: null,
            messages: [],
            chat: null,
            timer: null,
        };
    },
    created() {
        this.initialize();
        this.timer = setInterval(x => {
            this.initialize();
        }, 5000);

    },
    methods: {
        initialize() {
            this.axios.get(`chats/${this.$route.params.id}`).then(x => {
                this.chat = x.data;
            });

             this.axios
                    .get(`chats/${this.$route.params.id}/messages`)
                    .then(x => {
                    this.messages = x.data;
                    });

        },
        async submit(validate) {
            if (!(await validate())) return;

            this.axios
                .post(`chats/${this.$route.params.id}/messages`, {
                    message: this.message
                })
                .then(x => {
                    this.messages.push({
                        text: this.message,
                        user: this.$auth.user()
                    });
                    this.message = null;
                });
        }
    }
};
</script>

<style></style>
