<template>
    <v-container>
        <v-card>
            <v-calendar
                type="month"
                now="2019-01-08"
                value="2019-01-08"
                :events="items"
            ></v-calendar>
        </v-card>
    </v-container>
</template>

<script>
export default {
    props: ["items"],
    data() {
        return {
            now: new Date(),
            value: new Date()
        };
    }
};
</script>

<style></style>
