<template>
    <v-data-iterator :items="editedItem.gallery" :search="search">
        <template v-slot:header>
            <v-expansion-panels accordion>
                <v-expansion-panel>
                    <v-expansion-panel-header
                        ><v-text-field
                            v-model="search"
                            clearable
                            hide-details
                            solo
                            flat
                            prepend-inner-icon="search"
                            label="Buscar"
                        ></v-text-field>
                        <template v-slot:actions>
                            <v-icon>add</v-icon>
                        </template>
                    </v-expansion-panel-header>
                    <v-expansion-panel-content>
                        <v-file-input
                            v-model="editedItem.files"
                            color="deep-purple accent-4"
                            label="Arxiu"
                            multiple
                            placeholder="Arxiu"
                            outlined
                            :show-size="1000"
                            @change="renderFileMultiple('gallery')"
                        >
                            <template
                                v-slot:selection="{
                                    index,
                                    text,
                                    file
                                }"
                            >
                                <v-chip
                                    color="deep-purple accent-4"
                                    dark
                                    label
                                    small
                                >
                                    {{ text }}
                                </v-chip>
                            </template>
                        </v-file-input>
                        <v-row>
                            <v-col
                                cols="12"
                                md="3"
                                v-for="gallery in editedItem.tempGallery"
                                :key="gallery"
                            >
                                <v-img :src="gallery"> </v-img>
                            </v-col>
                        </v-row>
                        <v-btn
                            v-if="
                                editedItem.files && editedItem.files.length > 0
                            "
                            fab
                            absolute
                            small
                            right
                            color="primary"
                            @click="saveGallery()"
                        >
                            <v-icon>
                                save
                            </v-icon>
                        </v-btn>
                    </v-expansion-panel-content>
                </v-expansion-panel>
            </v-expansion-panels>
        </template>

        <template v-slot:default="props">
            <v-row>
                <v-col
                    v-for="item in props.items"
                    :key="item.id"
                    cols="12"
                    sm="4"
                    md="4"
                    lg="4"
                >
                    <v-card>
                        <v-img :src="item.url" class="white--text" contain>
                            <!-- gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)" -->
                            <!--  -->
                            <v-card-title
                                class="fill-height align-end"
                                v-text="item.name"
                            ></v-card-title>
                        </v-img>
                        <v-icon @click="downloadImg(item.url)">
                            download
                        </v-icon>
                        <v-icon v-if="deleteFile" @click="deleteImg(item.id)">
                            delete
                        </v-icon>
                    </v-card>
                </v-col>
            </v-row>
        </template>
    </v-data-iterator>
</template>

<script>
export default {
    props: {
        editedItem: Object,
        saveUrl: String,
        deleteUrl : String,
        deleteFile: {
            default: true,
            type: Boolean
        }

    },
    data() {
        return {
            search: null
        };
    },
    methods: {
        renderFileMultiple() {
            if (!this.editedItem.tempGallery) this.editedItem.tempGallery = [];

            this.editedItem.files.forEach((x, i) => {
                let URL = window.URL || window.webkitURL;
                if (URL && URL.createObjectURL) {
                    this.editedItem.tempGallery[i] = URL.createObjectURL(x);
                }
            });
        },
        saveGallery() {
            let formData = new FormData();

            this.editedItem.files.forEach((file, i) => {
                formData.append(`gallery[${i}]`, file);
            });
            this.axios.post(this.saveUrl, formData).then(resp => {
                this.editedItem.gallery = resp.data;
            });
        },
        downloadImg(url) {
            var yourstring = url;
            var index = yourstring.lastIndexOf("/") + 1;
            var filename = yourstring.substr(index);
            this.axios({
                    url: url,
                    method: 'GET',
                    responseType: 'blob',
                }).then((response) => {
                     var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                     console.log('fileURL == ',fileURL)
                     var fileLink = document.createElement('a');

                     fileLink.href = fileURL;
                     fileLink.setAttribute('download', filename);
                     document.body.appendChild(fileLink);

                     fileLink.click();
                });
        },
        deleteImg(id) {
            let url = this.deleteUrl + '/' +id;
            this.axios({
                url: url,
                method: 'POST',
                responseType: 'json',
            }).then((response) => {
                 if(response.data.status){
                        const index = this.editedItem.gallery.findIndex(item => item.id === id);
                        if (~index)
                        this.editedItem.gallery.splice(index, 1);
                 }
            });
        },
        remoteURL() {
        //return this.BASE_URL + link //link is the image's path fetched from database
        return this.link;
        },
    }
};
</script>

<style></style>
