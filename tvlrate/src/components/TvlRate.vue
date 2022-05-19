<template>
    <v-container class="main">
        <div class="line-tvl-container">
            <template v-if="payoutsTvlData">
                <LineChartTvl :data="payoutsTvlData" :totalUsdPlusValue="totalUsdPlusValue"/>
            </template>
        </div>
    </v-container>
</template>

<script>

import moment from "moment";
import LineChartTvl from "./chart/LineChartTvl";

export default {
    name: 'TvlRate',

    components: {
        LineChartTvl
    },

    props: {},

    data: () => ({
        payoutsTvlData: [],
        totalUsdPlusValue: null,
    }),

    computed: {},

    created() {
        this.getTvlRateData();
    },

    methods: {

        fillData(value) {
            let widgetDataDictTvl = {};
            let widgetDataTvl = {
                labels: [],
                datasets: [
                    {
                        fill: false,
                        data: [],
                    }
                ]
            };

            [...value].reverse().forEach(item => {
                widgetDataDictTvl[moment(item.payableDate).format('DD.MM.YYYY')] = item.totalUsdPlus;
            });

            for(let key in widgetDataDictTvl) {
                widgetDataTvl.labels.push(key);
                widgetDataTvl.datasets[0].data.push(widgetDataDictTvl[key]);
            }

            this.payoutsTvlData = widgetDataTvl;

            if (value && value.length > 0) {
                this.totalUsdPlusValue = value[0].totalUsdPlus;
            }
        },

        getTvlRateData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/dapp/payouts', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillData(value);
                }).catch(reason => {
                console.log('Error get data: ' + reason);
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

.line-tvl-container {
    width: 800px !important;
    background: #111E37 !important;
    border: 1px solid #4C586D !important;
    box-sizing: border-box;
}

</style>
