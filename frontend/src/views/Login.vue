<template>
    <v-container
        class="fill-height"
        fluid
        style="background-image:url(https://i.imgur.com/KdJZZ3r.jpg); background-size:cover"
    >
        <v-row align="center" justify="center">
            <v-col cols="12" sm="8" md="4">
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
                        <v-toolbar color="primary" dark flat>
                            <v-toolbar-title>Acces</v-toolbar-title>
                            <div class="flex-grow-1"></div>
                        </v-toolbar>
                        <v-card-text>
                            <v-form>
                                <VTextFieldWithValidation
                                    rules="required|email"
                                    v-model="form.email"
                                    label="Mail"
                                    prepend-icon="person"
                                />
                                <VTextFieldWithValidation
                                    rules="required"
                                    :type="showpwd ? 'Contrasenya' : 'password'"
                                    v-model="form.password"
                                    label="Contrasenya"
                                    prepend-icon="lock"
                                    @click:append="showpwd = !showpwd"
                                    :append-icon="
                                        showpwd
                                            ? 'visibility_off'
                                            : 'visibility'
                                    "
                                />
                            </v-form>
                        </v-card-text>
                        <v-card-actions>
                            <div class="flex-grow-1"></div>
                            <v-btn
                                color="primary"
                                @click="login"
                                :disabled="invalid"
                                >Login</v-btn
                            >
                        </v-card-actions>
                    </v-card>
                </ValidationObserver>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
export default {
    data() {
        return {
            form: {},
            sections: [],
            dialog: false,
            showpwd: false
        };
    },
    methods: {
        resetPwd() {
            // this.$validator.validateAll("resetForm").then(validated => {
            //     if (!validated) return;

            this.axios
                .post("/password/create", { email: this.form.emailreset })
                .then(() => {
                    this.$store.commit("showSnackbar", {
                        text: "Mail enviad",
                        color: "success"
                    });
                });
            // });
        },
        login() {
            // this.$validator.validateAll("login").then(validated => {
            //     if (!validated) return;

            this.$auth.login({
                data: this.form,
                rememberMe: true,
                success() {
                    this.$store.commit("showSnackbar", {
                        text: "Accés correcte",
                        color: "success"
                    });
                },
                error(error) {
                    this.$store.commit("showSnackbar", {
                        text: error.response.data.msg,
                        color: "error"
                    });
                }
            });
            // });
        }
    }
};
</script>
