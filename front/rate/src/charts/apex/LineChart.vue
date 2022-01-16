<template>
    <div>
        <div id="chart"></div>
    </div>
</template>

<script>
/* eslint-disable no-unused-vars,no-undef */

import {mapActions, mapGetters, mapMutations} from "vuex";

import ApexCharts from 'apexcharts'

export default {
    name: "LineChart",

    props: {
        data: {
            type: Array,
            default: null,
        },
    },

    watch: {
        data: function (newVal, oldVal) {
            this.redraw();
        },
    },

    components: {},

    data: () => ({
    }),

    computed: {
        ...mapGetters([
        ]),
    },

    mounted() {
        this.redraw();
    },

    created() {
    },

    methods: {
        ...mapActions([]),

        ...mapMutations([
        ]),

        redraw() {

            let values = [];
            this.data.datasets[0].data.forEach(v => values.push(v));

            let labels = [];
            // labels.push("");
            this.data.labels.forEach(v => labels.push(v));

            let options = {
                series: [{
                    name: "Rate",
                    data: values
                }],

                chart: {
                    type: 'area',
                    height: 400,
                    width: 1100,


                    sparkline: {
                        enabled: false,
                    },

                    zoom: {
                        enabled: false
                    },

                    background: '#0F1A26',

                    toolbar: {
                        show: false
                    }
                },

                grid: {
                    show: false,
                },

                dataLabels: {
                    enabled: false
                },

                stroke: {
                    curve: 'straight',
                    width: 1,
                    colors: ["#51FF00"],
                },

                labels: labels,

                xaxis: {
                    type: 'category',

                    tickAmount: 15,
                    tickPlacement: 'between',

                    labels: {
                        rotate: -45,
                        rotateAlways: true,
                        minHeight: 50,

                        style: {
                            cssClass: 'xaxis-label',
                        },
                    },

                    axisBorder: {
                        show: false,
                    },

                    axisTicks: {
                        show: false,
                    },
                },

                yaxis: {
                    opposite: false,

                    labels: {
                        minWidth: 40,
                        style: {
                            cssClass: 'yaxis-label',
                        },
                        formatter: (value) => { return value + '%' },
                    },
                },

                legend: {
                    horizontalAlign: 'left'
                },

                colors: ['#48e400'],

                theme: {
                    mode: 'dark',
                },

                fill: {
                    gradient: {
                        shade: 'dark',
                        type: "vertical",
                        shadeIntensity: 0.8,
                        opacityFrom: 1,
                        opacityTo: 0,
                        stops: [0, 100],
                        colorStops: []
                    },
                }

            };

            let chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        },
    }
}
</script>

<style>

.xaxis-label {
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    fill: #B1B1B1 !important;
}

.yaxis-label {
    font-weight: bold;
    font-size: 21px;
    fill: #B1B1B1 !important;
}

</style>