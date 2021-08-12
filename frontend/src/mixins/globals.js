import { mapState } from "vuex";
export default {
    data() {
        return {
            noResultTexto: "no s´han trobat registres",
            quickSearch: "Búsqueda ràpida",
            rowsPerPage: 15
        };
    },
    methods: {},
    computed: {
        ...mapState(["isViewLoading"])
    },
    filters: {}
};
