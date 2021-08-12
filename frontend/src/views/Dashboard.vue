<template>
    <v-container>
        <v-layout wrap>
            <v-flex
                @click="$router.push(item.link)"
                xs3
                class="pointer"
                :key="item.link"
                v-for="item in itemsComputed"
            >
            <!-- xs-1 sm-2 md-4 lg-4  xl-6    mx-2 mb-4-->
                <v-card class="mx-2 mb-4 text-center" color="#26c6da" dark>
                    <v-card-title class="text-center">
                        <v-icon large left>
                            {{ item.icon }}
                        </v-icon>
                        <span class="title font-weight-light">{{
                            item.title
                        }}</span>
                    </v-card-title>

                    <v-card-text class="headline font-weight-bold">
                    </v-card-text>

                    <v-card-actions> </v-card-actions>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>

export default {
    computed: {
        itemsComputed() {

            return this.items.filter(item => {
                if (
                    item.superAdminOnly &&
                    this.$auth.user().role != "Administracio"
                ) {
                    return false;
                }

                if (
                    item.customersOnly &&
                    this.$auth.user().role == "Administracio"
                ) {
                    return false;
                }

                if (item.adminOnly && this.$auth.user().role != "admin") {
                    return false;
                }

                if (
                    (item.link == "/workers") &&
                    ["Treballador"].includes(this.$auth.user().role)
                ) {
                    return true;
                }

                if (
                    (item.link == "/company" || item.link == "/expenses") &&
                    ["Treballador"].includes(this.$auth.user().role)
                ) {
                    return false;
                }

                if (
                    item.workerOnly &&
                    ["Treballador"].includes(this.$auth.user().role)
                ) {
                    return false;
                }

                if (
                    item.referentOnly &&
                    !["Referent econòmic", "Referent social"].includes(
                        this.$auth.user().role
                    )
                ) {
                    return false;
                }

                if (
                    item.referentOnly &&
                    !["Particular"].includes(this.$auth.user().role)
                ) {
                    return false;
                }

                if (!this.$auth.check(item.permission)) {
                    return false;
                }

                return true;
            });
        }
    },
    data() {

        console.log(this.$auth.user().role);

        if('Referent economic' == this.$auth.user().role){
          return {
            items: [
                    {
                        title: "Xats",
                        link: `/chats`,
                        icon: "chat"
                    },
                    {
                        title: "Pacients",
                        link: "/patients",
                        icon: "person",
                        permission: "read patients"
                    }, {
                        title: "Factures",
                        link: "/invoices",
                        icon: "event_note",
                        permission: "read patient_invoices"
                    },{
                        title: "Pressupost",
                        link: "/budgets",
                        icon: "event_note",
                        permission: "read patient_invoices"
                   }
                ]
                };
        }else if('Referent social' == this.$auth.user().role){
           return {
            items: [
                    {
                        title: "Xats",
                        link: `/chats`,
                        icon: "chat"
                    },
                    {
                        title: "Pacients",
                        link: "/patients",
                        icon: "person",
                        permission: "read patients"
                    },
                    {  
                        title: "Tàsques ",
                        link: "/tasks",
                        icon: "event_note",
                        permission: "read tasks"
                    }
                ]
                };
        }else if('Treballador' == this.$auth.user().role){
            return {
            items: [
                {
                    title: "Entitats",
                    link: "/entities",
                    icon: "apartment",
                    permission: "read entities"
                },
                {
                    title: "Referents",
                    link: "/referents",
                    icon: "repeat",
                    permission: "read referents"
                },
                // {
                //     title: "Treballadors",
                //     link: "/workers",
                //     icon: "work",
                //     permission: "read workers"
                // },
                // {
                //     title: "Profile",
                //     link: `/profile/`,
                //     icon: "work",
                //     workerOnly: true
                // },
                {
                    title: "Xats",
                    link: `/chats`,
                    icon: "chat"
                },
                {
                    title: "Despeses",
                    link: `/expenses`,
                    icon: "attach_money"
                },
                {
                    title: "Pacients",
                    link: "/patients",
                    icon: "person",
                    permission: "read patients"
                },
                {
                    title: "Rols",
                    link: "/roles",
                    icon: "lock_open",
                    permission: "read roles"
                },
                {
                    title: "Proveïdors",
                    link: "/providers",
                    icon: "store_mall_directory",
                    permission: "read providers"
                },
                {
                    title: "Tàsques ",
                    link: "/tasks",
                    icon: "event_note",
                    permission: "read tasks"
                },
                {
                    title: "Factures",
                    link: "/invoices",
                    icon: "event_note",
                    permission: "read patient_invoices"
                },
                {
                    title: "Pressupost",
                    link: "/budgets",
                    icon: "event_note",
                    permission: "read patient_invoices"
                }
            ]
        };
        }else if('Administracio' != this.$auth.user().role){
            return {
            items: [
                {
                    title: "Entitats",
                    link: "/entities",
                    icon: "apartment",
                    permission: "read entities"
                },
                {
                    title: "Referents",
                    link: "/referents",
                    icon: "repeat",
                    permission: "read referents"
                },
                {
                    title: "Treballadors",
                    link: "/workers",
                    icon: "work",
                    permission: "read workers"
                },
                // {
                //     title: "Profile",
                //     link: `/profile/`,
                //     icon: "work",
                //     workerOnly: true
                // },
                // {
                //     title: "Profile",
                //     link: `/profile_referent/`,
                //     icon: "home",
                //     referentOnly: true
                // },
                {
                    title: "Xats",
                    link: `/chats`,
                    icon: "chat"
                },
                {
                    title: "Despeses",
                    link: `/expenses`,
                    icon: "attach_money"
                },
                {
                    title: "Pacients",
                    link: "/patients",
                    icon: "person",
                    permission: "read patients"
                },
                {
                    title: "Rols",
                    link: "/roles",
                    icon: "lock_open",
                    permission: "read roles"
                },
                {
                    title: "Proveïdors",
                    link: "/providers",
                    icon: "store_mall_directory",
                    permission: "read providers"
                },
                {
                    title: "Tàsques ",
                    link: "/tasks",
                    icon: "event_note",
                    permission: "read tasks"
                },
                {
                    title: "Factures",
                    link: "/invoices",
                    icon: "event_note",
                    permission: "read patient_invoices"
                },
                {
                    title: "Pressupost",
                    link: "/budgets",
                    icon: "event_note",
                    permission: "read patient_invoices"
                }
            ]
        };
        }else{
            return {
            items: [
                {
                    title: "Companyia",
                    link: "/company",
                    icon: "home_work"
                },
                {
                    title: "Entitats",
                    link: "/entities",
                    icon: "apartment",
                    permission: "read entities"
                },
                {
                    title: "Referents",
                    link: "/referents",
                    icon: "repeat",
                    permission: "read referents"
                },
                {
                    title: "Treballadors",
                    link: "/workers",
                    icon: "work",
                    permission: "read workers"
                },
                // {
                //     title: "Profile",
                //     link: `/profile/`,
                //     icon: "work",
                //     workerOnly: true
                // },
                // {
                //     title: "Profile",
                //     link: `/profile_referent/`,
                //     icon: "home",
                //     referentOnly: true
                // },
                {
                    title: "Xats",
                    link: `/chats`,
                    icon: "chat"
                },
                {
                    title: "Despeses",
                    link: `/expenses`,
                    icon: "attach_money"
                },
                {
                    title: "Pacients",
                    link: "/patients",
                    icon: "person",
                    permission: "read patients"
                },
                {
                    title: "Rols",
                    link: "/roles",
                    icon: "lock_open",
                    permission: "read roles"
                },
                {
                    title: "Proveïdors",
                    link: "/providers",
                    icon: "store_mall_directory",
                    permission: "read providers"
                },
                {
                    title: "Tàsques ",
                    link: "/tasks",
                    icon: "event_note",
                    permission: "read tasks"
                },
                {
                    title: "Factures",
                    link: "/invoices",
                    icon: "event_note",
                    permission: "read patient_invoices"
                },
                {
                    title: "Pressupost",
                    link: "/budgets",
                    icon: "event_note",
                    permission: "read patient_invoices"
                },
                 {
                    title: "Serveis",
                    link: "/services",
                    icon: "event_note"
                }
            ]
        };
        }
    }
};
</script>
