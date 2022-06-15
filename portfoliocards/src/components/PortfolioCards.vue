<template>
    <v-container class="main">
        <v-row>
            <v-col>
                <StablecoinsCard title="portfolio collateral" :data="stablecoinsData"/>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <StrategiesCard title="strategies in portfolio" :data="strategiesData" :totalUsdPlusValue="totalUsdPlusValue"/>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>

import StrategiesCard from "./card/StrategiesCard";
import StablecoinsCard from "./card/StablecoinsCard";
export default {
    name: 'PortfolioCards',

    components: {
        StablecoinsCard,
        StrategiesCard,
    },

    props: {},

    data: () => ({
        strategiesData: [],
        totalUsdPlusValue: null,

        stablecoinsData: [],

        colors: [
            "#FCCA46",
            "#FE7F2D",
            "#3D8DFF",
            "#22ABAC",
            "#B22174",
            "#2775CA",
            "#26A17B",
            "#23DD00",
        ],

        colorsStablecoins: [
            "#2775CA",
            "#26A17B",
            "#FCCA46",
            "#FE7F2D",
            "#B22174",
        ],
    }),

    computed: {},

    created() {
        this.getStrategiesData();
        this.getStablecoinsData();
    },

    methods: {
        fillStrategiesData(value) {
            let result = [];

            value.sort((a,b) => b.netAssetValue - a.netAssetValue);

            for (let i = 0; i < value.length; i++) {
                let element = value[i];

                result.push(
                    {
                        label: element.name,
                        fullName: element.fullName,
                        value: element.netAssetValue,
                        color: this.colors[i],
                        link: element.address ? 'https://polygonscan.com/address/' + element.address : ''
                    }
                );
            }

            this.strategiesData = result;
        },

        fillStablecoinsData(value) {
            let result = [];

            value.sort((a,b) => b.netAssetValue - a.netAssetValue);
            value = value.filter(el => el.netAssetValue > 0);

            for (let i = 0; i < value.length; i++) {
                let element = value[i];

                try {
                    result.push(
                        {
                            label: element.id.tokenName,
                            value: element.netAssetValue,
                            link: element.tokenAddress ? element.tokenAddress : '',
                            color: this.colorsStablecoins[i],
                            logo: require('../assets/currencies/' + element.id.tokenName + '.png')
                        }
                    );
                } catch (e) {
                    console.error("Error while adding stablecoin to list: " + e);
                }
            }

            this.stablecoinsData = result;
        },

        getStrategiesData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/dapp/getTotalUsdPlusValue', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.totalUsdPlusValue = value;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
            })

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/dapp/strategies', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillStrategiesData(value)
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        getStablecoinsData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/dapp/collateral/total', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillStablecoinsData(value)
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },
    }
}
</script>


<style scoped>

.main {
    font-style: normal;
    width: 100%;
    display: inline-block;

    background: none;
}

</style>
