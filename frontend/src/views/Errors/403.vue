<template>
    <v-container>
        <v-layout wrap>
            <v-flex xs12>
                <v-card class="mx-auto mb-4" color="error" dark max-width="600">
                    <v-card-title>
                        <v-icon large left>
                            error
                        </v-icon>
                        <span class="title font-weight-light">Error</span>
                    </v-card-title>

                    <v-card-text class="headline font-weight-bold">
                        No cuentas con los permisos para acceder a esa pagina
                    </v-card-text>

                    <v-card-actions>
                        <v-row align="center" justify="end">
                            <!-- <v-icon @click="$router.back" class="mr-1"
                                >back</v-icon
                            >
                            <span class="subheading mr-2">Volver</span> -->
                            <!-- <span class="mr-1">·</span>
                            <v-icon class="mr-1">mdi-share-variant</v-icon>
                            <span class="subheading">45</span> -->
                        </v-row>
                    </v-card-actions>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
export default {
    data() {}
};
</script>

<style>
.v-sheet--offset {
    top: -24px;
    position: relative;
}
</style>
