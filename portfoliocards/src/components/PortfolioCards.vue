<template>
    <v-container class="main">
        <v-row>
            <v-col>
                <StablecoinsCard title="stablecoins in portfolio" :data="stablecoinsData"/>
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
    }),

    computed: {},

    created() {
        this.stablecoinsData = [
            {"label": "USDC", "value": 313222.68, "link": "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174", "color": "#2775CA", "logo": require('../assets/currencies/usdc.png')},
            {"label": "USDT", "value": 177460.28, "link": "0xc2132d05d31c914a87c6611c10748aeb04b58e8f", "color": "#26A17B", "logo": require('../assets/currencies/usdt.png')},
            // {"label": "DAI", "value": 0, "link": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063", "color": "#FCCA46", "logo": require('../assets/currencies/dai.svg')},
        ];

        this.getStrategiesData();
    },

    methods: {
        fillStrategiesData(value) {
            let result = [];

            value.sort((a,b) => b[4] - a[4]);

            for (let i = 0; i < value.length; i++) {
                let element = value[i];

                result.push(
                    {
                        label: element[0],
                        fullName: element[1],
                        value: element[4],
                        color: this.colors[i],
                        link: element[3] ? 'https://polygonscan.com/address/' + element[3] : ''
                    }
                );
            }

            this.strategiesData = result;
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
