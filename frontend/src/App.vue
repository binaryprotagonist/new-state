<template>
    <v-app id="inspire">
        <template v-if="$auth.ready()">
            <Header v-if="$auth.check()"></Header>
            <!-- <v-switch
                v-model="$vuetify.theme.dark"
                primary
                label="Dark"
            ></v-switch> -->
            <div v-if="!$auth.ready()">
                <v-progress-linear
                    color="blue darken-4"
                    height="6"
                    :indeterminate="true"
                ></v-progress-linear>
            </div>
            <v-content
                v-if="!isLoading"
                fill-height
                transition="slide-x-transition"
            >
                <router-view></router-view>
            </v-content>
        </template>
        <div v-if="!$auth.ready()">
            <v-progress-linear
                color="blue darken-4"
                height="6"
                :indeterminate="true"
            ></v-progress-linear>
        </div>
        <v-snackbar
            top
            v-model="snackbar.show"
            :timeout="snackbar.timeout"
            :multi-line="snackbar.multiline === true"
            :color="snackbar.color"
        >
            {{ snackbar.text }}
            <v-btn text dark @click="closeSnackbar">Cerrar</v-btn>
        </v-snackbar>
    </v-app>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import Header from "@/views/layouts/Header";
export default {
    name: "App",
    components: { Header },
    data: () => ({
        //
    }),
    computed: {
        ...mapState(["snackbar", "isLoading", "isDark"])
    },
    created() {},
    methods: {
        ...mapMutations(["closeSnackbar"])
    }
};
</script>
