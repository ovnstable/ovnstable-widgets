<template>
    <v-container class="main">
        <v-row>
            <v-col>
<!--                <StrategiesCard title="strategies in portfolio" :data="strategiesData" :totalUsdPlusValue="totalUsdPlusValue"/>-->
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <StablecoinsCard title="stablecoins in portfolio" :data="stablecoinsData"/>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>

// import StrategiesCard from "./card/StrategiesCard";
import StablecoinsCard from "./card/StablecoinsCard";
export default {
    name: 'PortfolioCards',

    components: {
        StablecoinsCard,
        // StrategiesCard,
    },

    props: {},

    data: () => ({
        strategiesData: [],
        totalUsdPlusValue: null,

        stablecoinsData: [],
    }),

    computed: {},

    created() {
        this.stablecoinsData = [
            {"label": "USDC", "value": 275098.07, "link": "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174", "color": "#3D8DFF", "logo": require('../assets/currencies/usdc.png')},
            {"label": "USDT", "value": 176885.48, "link": "0xc2132d05d31c914a87c6611c10748aeb04b58e8f", "color": "#22ABAC", "logo": require('../assets/currencies/usdt.svg')},
            {"label": "DAI", "value": 62218.44, "link": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063", "color": "#FCCA46", "logo": require('../assets/currencies/dai.svg')},
        ];
    },

    methods: {
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
