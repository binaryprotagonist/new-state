import Vue from "vue";
import Vuetify from "vuetify/lib";
import ca from "vuetify/es5/locale/ca";

Vue.use(Vuetify);

export default new Vuetify({
    icons: {
        iconfont: "md"
    },
    lang: {
        locales: { ca },
        current: "ca"
    },
    theme: {
        dark: true
    }
});
