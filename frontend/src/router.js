import Vue from "vue";
import Router from "vue-router";
// import Home from "./views/Home.vue";

Vue.use(Router);

export default new Router({
    mode: "history",
    base: process.env.BASE_URL,
    routes: [
        {
            path: "/login",
            name: "login",
            meta: { auth: false },
            component: () => import("./views/Login.vue")
        },
        {
            path: "/403",
            name: "403",
            meta: { auth: true },
            component: () => import("./views/Errors/403.vue")
        },
        {
            path: "/",
            name: "dashboard",
            meta: { auth: true },
            component: () => import("./views/Dashboard.vue")
        },
        {
            path: "/entities",
            name: "entities",
            meta: { auth: ["read entities"] },
            component: () => import("./views/Entities/Index.vue")
        },
        {
            path: "/services",
            name: "services",
            meta: { },
            component: () => import("./views/Services/Index.vue")
        },
        {
            path: "/roles",
            name: "roles",
            meta: { auth: ["read roles"] },
            component: () => import("./views/Roles.vue")
        },
        {
            path: "/referents",
            name: "referents",
            meta: { auth: ["read referents"] },
            component: () => import("./views/Referents/Index.vue")
        },
        {
            path: "/patients",
            name: "patients",
            meta: { auth: ["read patients"] },
            component: () => import("./views/Patients/Index.vue")
        },
        {
            path: "/patients/:id",
            name: "patients_show",
            meta: { auth: ["read patients"] },
            component: () => import("./views/Patients/Show.vue")
        },
        {
            path: "/patients/:id/pai",
            name: "patients_show_pai",
            meta: { auth: ["read patients"] },
            component: () => import("./views/Patients/PAI.vue")
        },
        {
            path: "/invoices",
            name: "invoices",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Invoices/Index.vue")
        },
        {
            path: "/invoices/:id",
            name: "invoice_edit",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Invoices/Edit.vue")
        },
        {
            path: "/invoices/create",
            name: "invoices.create",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Invoices/Create.vue")
        },
        {
            path: "/budgets",
            name: "budgets",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Budgets/Index.vue")
        },
        {
            path: "/budgets/:id",
            name: "budget_edit",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Budgets/Edit.vue")
        },
        {
            path: "/budgets/create",
            name: "budget.create",
            meta: { auth: ["read patient_invoices"] },
            component: () => import("./views/Budgets/Create.vue")
        },
        {
            path: "/company",
            name: "company",
            meta: { auth: true },
            component: () => import("./views/Company.vue")
        },
        {
            path: "/workers",
            name: "workers",
            meta: { auth: ["read workers"] },
            component: () => import("./views/Workers/Index.vue")
        },
        {
            path: "/workers/:id",
            name: "workers_show",
            meta: { auth: ["read workers"] },
            component: () => import("./views/Workers/Show.vue")
        },
        {
            path: "/providers",
            name: "providers",
            meta: { auth: ["read providers"] },
            component: () => import("./views/Providers/Index.vue")
        },
        {
            path: "/providers/:id",
            name: "providers_show",
            meta: { auth: ["read providers"] },
            component: () => import("./views/Providers/Show.vue")
        },
        {
            path: "/expenses",
            name: "expenses",
            meta: { auth: ["Administracio", "Coordinacio"] },
            component: () => import("./views/Expenses/Index.vue")
        },
        {
            path: "/profile_referent",
            name: "profile",
            meta: { auth: true },
            component: () => import("./views/Entities/Profile.vue")
        },
        {
            path: "/profile_particular",
            name: "profile",
            meta: { auth: true },
            component: () => import("./views/Entities/Profile_Particular.vue")
        },
        {
            path: "/profile",
            name: "profile",
            meta: { auth: true },
            component: () => import("./views/Workers/Profile.vue")
        },
        {
            path: "/tasks",
            name: "tasks",
            meta: { auth: ["read tasks"] },
            component: () => import("./views/Tasks/Index.vue")
        },
        {
            path: "/tasks/:id",
            name: "tasks_show",
            meta: { auth: ["read tasks"] },
            component: () => import("./views/Tasks/Show.vue")
        },
        {
            path: "/chats",
            name: "chats",
            meta: { auth: true },
            component: () => import("./views/Chats/Index.vue")
        },
        {
            path: "/chats/:id",
            name: "chats_show",
            meta: { auth: true },
            component: () => import("./views/Chats/Show.vue")
        }
    ]
});

