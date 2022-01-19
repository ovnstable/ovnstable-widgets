<template>
    <div class="main">
        <div>
            <img width="37px" alt="Ovn logo" :src="image">
            <label class="title" @click="clickLogo">
                Overnight<sup>&reg;</sup>
                <div class="rectangle"></div>
                Portfolio
            </label>
        </div>

        <div class="doughnut">
            <template v-if="dataStrategies || dataAssets">
                <v-row v-if="dataStrategies">
                    <Doughnut
                            style="margin-left: -50px;"
                            refer="doughnut_strategies"
                            :data="dataStrategies"
                            :height="doughnutHeight"
                            :animated="animated"
                            :percentsOnly="percentsOnly"
                            :diffuse="diffuse"
                            :dark="!theme"
                            :legend="showLegend"
                            :color="theme ? '#101A26' : 'white'"
                            title="Strategies"
                    />
                </v-row>
                <v-row v-if="dataAssets" :style="{'margin-top': dataStrategies ? '-120px' : '0px'}">
                    <Doughnut
                            style="margin-left: -50px;"
                            refer="doughnut_assets"
                            :data="dataAssets"
                            :height="doughnutHeight"
                            :animated="animated"
                            :percentsOnly="percentsOnly"
                            :diffuse="diffuse"
                            :dark="!theme"
                            :legend="showLegend"
                            :color="theme ? '#101A26' : 'white'"
                            title="Stablecoins"
                    />
                </v-row>
            </template>
            <template v-else>
                <div class="loader"></div>
            </template>
        </div>
        <div class="signature" @click="clickLogo">
            <div class="powered-by">Powered by</div>
            <div class="powered">overnight.fi</div>
        </div>
    </div>
</template>

<script>

import Doughnut from "../charts/Doughnut";
import UsdPlusImage from '../assets/usdPlus.json';

export default {
    name: 'DoughnutChart',

    components: {
        Doughnut
    },

    props: {},

    data: () => ({
        image: UsdPlusImage.image,

        loading: true,

        doughnutHeight: 400,
        animated: false,
        percentsOnly: true,
        theme: false,
        diffuse: true,
        showLegend: true,

        colors: [
            "#51FF00",
            "#FCCA46",
            "#4469EB",
            "#A55BEB",
            "#5093EB",
            "#EB73B1",
            "#FE7F2D",
            "#EB5062",
        ],

        dataAssets: [],
        dataStrategies: [],
    }),

    computed: {},

    created() {
        this.getAssetsData();
        this.getStrategiesData();
    },

    methods: {

        fillAssetsData(value) {
            let result = [];

            for (let i = 0; i < value.length; i++) {
                let element = value[i];

                result.push(
                    {
                        title: element.title,
                        value: element.value,
                        color: this.colors[(this.colors.length / 2 + i) % this.colors.length],
                    }
                );
            }

            this.dataAssets = result;
        },

        getAssetsData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/doughnut-assets', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillAssetsData(value)
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        fillStrategiesData(value) {
            let result = [];

            for (let i = 0; i < value.length; i++) {
                let element = value[i];

                result.push(
                    {
                        title: element.title,
                        value: element.value,
                        color: this.colors[i],
                        link: element.link ? 'https://polygonscan.com/address/' + element.link : ''
                    }
                );
            }

            this.dataStrategies = result;
        },

        getStrategiesData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/doughnut-strategies', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillStrategiesData(value)
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        clickLogo() {
            window.open(process.env.VUE_APP_GO_TO_URL, '_blank').focus();
        }
    }
}
</script>


<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap');

.title {
    font-family: 'Raleway', sans-serif;
    font-size: 32px;
    color: white;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
    vertical-align: super;
}

.title > sup {
    font-size: 8px;
    vertical-align: super;
}

.rectangle {
    display: inline-block;
    vertical-align: sub;
    position: static;
    width: 3px;
    height: 32px;

    background: #FE7F2D;
    border-radius: 4px;

    flex: none;
    order: 1;
    flex-grow: 0;

    margin-right: 3px;
    margin-left: 8px;
}

.signature {
    margin-top: 10px;
    cursor: pointer;
}

.powered {
    font-weight: 500;
    font-size: 15px;
    color: white;
    margin-right: 5px;
}

.powered-by {
    font-weight: 500;
    font-size: 15px;
    color: #808a9d;
    margin-right: 5px;
}

.loader {
    margin-left: auto;
    margin-right: auto;
    margin-top: 5px;
    border: 5px solid #f3f3f3; /* Light grey */
    border-top: 5px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 20px;
    height: 20px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

a:link {
    color: #131313;
    text-decoration: none;
}

a:visited {
    color: #131313;
    text-decoration: none;
}

.main {
    font-style: normal;
    width: 100%;
    padding: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;

    border-radius: 10px;
    background-color: #0F1A26;

    text-align: center;
}

</style>
