<template>
    <span>
        <v-navigation-drawer class="bg-primary" app temporary v-model="drawer">
            <!-- <v-img
                src="/img/sate-logo-blanco.png"
                max-width="200"
                class="mx-auto"
            >
            </v-img> -->
             <v-img src="img/sate-logo-blanco.png" class="mx-auto" max-width="200">
                <!-- gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)" -->
                <!--  -->
            </v-img>
            <v-divider class="mt-5"></v-divider>
            <div class="pa-2 text-center">
                {{ $auth.user().name }}
                ({{ $auth.user().role }})
            </div>
            <v-divider class="mt-1"></v-divider>
            <v-list dense>
                <!-- eslint-disable  -->
                <v-list-item
                    v-for="(item, i) in itemsComputed"
                    v-if="!item.children"
                    :key="i"
                    :to="item.link"
                    @click="drawer = false"
                    link
                >
                    <v-list-item-icon>
                        <v-icon>{{ item.icon }}</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content>
                        <v-list-item-title>{{ item.title }}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
                <!-- :prepend-icon="item.icon" -->
                <v-list-group sub-group v-else>
                    <template v-slot:activator>
                        <v-list-item-title>{{ item.title }}</v-list-item-title>
                    </template>
                    <v-list-item
                        @click="drawer = false"
                        v-for="(sub, n) in item.children"
                        :to="sub.link"
                        :key="n"
                    >
                        <v-list-item-title v-text="item.title" />
                        <v-list-item-icon>
                            <v-icon v-text="sub.icon"></v-icon>
                        </v-list-item-icon>
                    </v-list-item>
                </v-list-group>
            </v-list>

            <template v-slot:append>
                <v-layout justify-center>
                    <v-flex>
                        <v-btn
                            icon
                            @click="logout"
                            class="hidden-sm-and-down pa-2"
                        >
                            <v-icon>power_settings_new</v-icon>
                        </v-btn>
                    </v-flex>
                </v-layout>
            </template>
        </v-navigation-drawer>
        <v-toolbar fixed align-center m-0 p-0>
            <v-layout xs12 row>
                <v-container fill-height fluid>
                    <v-layout align-center justify-center>
                        <v-app-bar-nav-icon
                            @click.stop="drawer = !drawer"
                        ></v-app-bar-nav-icon>

                        <v-spacer class="hidden-sm-and-down"></v-spacer>
                        <h1 class="hidden-sm-and-down">
                            Sate
                        </h1>
                        <v-spacer class="hidden-sm-and-down"></v-spacer>
                        <v-tooltip bottom v-slot:activator="{ on }">
                            <v-btn
                                icon
                                v-on="on"
                                @click="logout"
                                class="hidden-sm-and-down"
                            >
                                <v-icon>power_settings_new</v-icon>
                            </v-btn>
                            <span>Sortir</span>
                        </v-tooltip>
                    </v-layout>
                </v-container>
            </v-layout>
        </v-toolbar>
    </span>
</template>
<script>
/* eslint-disable */
export default {
    name: "vHeader",
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
                    item.workerOnly &&
                    !["Treballador"].includes(this.$auth.user().role)
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
        if('Treballador' == this.$auth.user().role){
            return {
            drawer: false,
            items: [
                {
                    title: "Inici",
                    link: "/",
                    icon: "flag"
                },
                // {
                //     title: "Companyia",
                //     link: "/company",
                //     icon: "home_work"
                // },
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
                // {
                //     title: "Despeses",
                //     link: `/expenses`,
                //     icon: "attach_money"
                // },
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
            drawer: false,
            items: [
                {
                    title: "Inici",
                    link: "/",
                    icon: "flag"
                },
                // {
                //     title: "Companyia",
                //     link: "/company",
                //     icon: "home_work"
                // },
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
                // {
                //     title: "Despeses",
                //     link: `/expenses`,
                //     icon: "attach_money"
                // },
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
            drawer: false,
            items: [
                {
                    title: "Inici",
                    link: "/",
                    icon: "flag"
                },
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
                {
                    title: "Profile",
                    link: `/profile/`,
                    icon: "work",
                    workerOnly: true
                },
                {
                    title: "Profile",
                    link: `/profile_referent/`,
                    icon: "home",
                    referentOnly: true
                },
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
                    title: "Serveis",
                    link: "/services",
                    icon: "event_note"
                },
                {
                    title: "Pressupost",
                    link: "/budgets",
                    icon: "event_note",
                    permission: "read patient_invoices"
                }
            ]
        };
        }

    },
    methods: {
        logout() {
            this.$auth.logout({
                makeRequest: true,
                params: {}, // data: {} in axios
                success: function() {},
                error: function() {},
                redirect: "/login"
                // etc...
            });
        }
    }
};
</script>
<style>
@media (max-width: 900px) {
    img#logo {
        width: 100px;
        margin: 0 0px 0 auto;
    }
}
</style>
