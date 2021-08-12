export default {
    data() {
        return {
            situations: ["tutela", "curatela", "no tutela"],
            residence: ["Domicili Particular", "Domicili Institucio"],
            menu: false,
            file: null
        };
    },
    methods: {
        renderFile(prop = null, obj = "editedItem") {
            if (!prop) return;
            // Create a blob field
            let URL = window.URL || window.webkitURL;
            if (URL && URL.createObjectURL) {
                this[obj][prop] = URL.createObjectURL(this[obj].file);
            }
        }
    },
    computed: {
        residence_economic() {
            return this.referents.filter(x => {
                return (
                    x.entity_id == this.editedItem.residency &&
                    x.role.includes("economic")
                );
            });
        },
        residence_social() {
            return this.referents.filter(x => {
                return (
                    x.entity_id == this.editedItem.residency &&
                    x.role.includes("social")
                );
            });
        },
        guardianship_economic() {
            return this.referents.filter(x => {
                return (
                    x.entity_id == this.editedItem.guardianship &&
                    x.role.includes("economic")
                );
            });
        },
        guardianship_social() {
            return this.referents.filter(x => {
                return (
                    x.entity_id == this.editedItem.guardianship &&
                    x.role.includes("social")
                );
            });
        }
    }
};
