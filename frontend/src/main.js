import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store/";
import "./registerServiceWorker";
import vuetify from "./plugins/vuetify";
import "./plugins/axios";
import "./plugins/vee-validate";
import globals from "./mixins/globals";
import VueMasonry from "vue-masonry-css";

Vue.use(VueMasonry);
Vue.mixin(globals);
Vue.config.productionTip = false;

Vue.router = router;

Vue.use(require("@websanova/vue-auth"), {
    http: require("@websanova/vue-auth/drivers/http/axios.1.x.js"),
    router: require("@websanova/vue-auth/drivers/router/vue-router.2.x.js"),
    auth: {
        request: function(req, token) {
            this.options.http._setHeaders.call(this, req, {
                Authorization: "Bearer " + token
            });
        },
        response: function(res) {
            return res.data.token;
        }
    },
    tokenExpired: false,
    rolesVar: "permissionss",
    loginData: {
        url: "/login",
        method: "POST",
        fetchUser: true,
        redirect: "/"
    },
    logoutData: {
        url: "/logout",
        method: "POST",
        redirect: "/",
        makeRequest: false
    },
    fetchData: { url: "/user", method: "GET", enabled: true },
    refreshData: {
        url: "/refresh",
        method: "GET",
        enabled: false,
        interval: 60
    }
});

new Vue({
    router,
    store,
    vuetify,
    render: h => h(App)
}).$mount("#app");
