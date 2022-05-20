<template>
    <v-container class="main">
        <div class="line-apy-container">
            <template v-if="payoutsApyData">
                <LineChartApy :data="payoutsApyData"/>
            </template>
        </div>
    </v-container>
</template>

<script>

import moment from "moment";
import LineChartApy from "./chart/LineChartApy";

export default {
    name: 'ApyRate',

    components: {
        LineChartApy
    },

    props: {},

    data: () => ({
        payoutsApyData: [],
    }),

    computed: {},

    created() {
        this.getApyRateData();
    },

    methods: {

        fillData(value) {
            let widgetDataDictApy = {};
            let widgetDataApy = {
                labels: [],
                datasets: [
                    {
                        fill: false,
                        data: [],
                    }
                ]
            };

            [...value].reverse().forEach(item => {
                widgetDataDictApy[moment(item.payableDate).format('DD.MM.YYYY')] = parseFloat(item.annualizedYield ? item.annualizedYield : 0.0).toFixed(4);
            });

            for(let key in widgetDataDictApy) {
                widgetDataApy.labels.push(key);
                widgetDataApy.datasets[0].data.push(widgetDataDictApy[key]);
            }

            this.payoutsApyData = widgetDataApy;
        },

        getApyRateData() {
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

.line-apy-container {
    width: 800px !important;
    background: #111E37 !important;
    border: 1px solid #4C586D !important;
    box-sizing: border-box;
}

</style>
