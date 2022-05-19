<template>
    <v-container class="dist-chart-container">
        <v-row class="chart-header-row">
            <v-col cols="12">
                <v-row class="header-text-row">
                    <v-spacer></v-spacer>
                    <label class="chart-title">{{ 'USD+ Daily APY Distribution' }}</label>
                    <v-spacer></v-spacer>
                </v-row>
            </v-col>
        </v-row>

        <div class="chart-row" id="line-chart-dist"></div>

        <v-row class="legend-row">
            <v-spacer></v-spacer>
            <div class="solid-legend"></div>
            <label class="legend-label">Overnight rate distribution</label>
            <div class="dash-legend"></div>
            <label class="legend-label">Normal distribution</label>
            <v-spacer></v-spacer>
        </v-row>
    </v-container>
</template>

<script>
/* eslint-disable no-unused-vars,no-undef */

import {mapActions, mapGetters, mapMutations} from "vuex";

import ApexCharts from 'apexcharts'
import moment from "moment";

export default {
    name: "LineChartDist",

    props: {
        data: {
            type: Object,
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
        chart: null,
    }),

    computed: {
    },

    mounted() {
        this.redraw();
    },

    created() {
    },

    methods: {
        ...mapMutations([]),

        redraw() {
            if (this.chart) {
                this.chart.destroy();
            }

            let values = [];
            this.data.datasets[0].data.forEach(v => values.push(v));

            let valuesColumn = [];
            this.data.datasets[1].data.forEach(v => valuesColumn.push(v));

            let labels = [];
            this.data.labels.forEach(v => labels.push(v));


            let options = {
                series: [{
                    name: this.data.datasets[1].label,
                    type: 'column',
                    data: valuesColumn
                }, {
                    name: this.data.datasets[0].label,
                    type: 'area',
                    data: values
                }],

                plotOptions: {
                    bar: {
                        borderRadius: 0,
                    }
                },

                chart: {
                    type: 'area',
                    height: 250,
                    width: 730,

                    sparkline: {
                        enabled: false,
                    },

                    zoom: {
                        enabled: false
                    },

                    background: '#111E37',

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
                    lineCap: "butt",
                    width: [0, 1],
                    colors: ["#3D8DFF", "#3D8DFF"],
                    dashArray: [0, 5],
                },

                labels: labels,

                xaxis: {
                    type: 'category',

                    tickAmount: 7,
                    tickPlacement: 'between',

                    labels: {
                        show: false,
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

                    tickAmount: 5,
                    min: 0,

                    labels: {
                        show: false,
                    },
                },

                legend: {
                    show: false,
                },

                theme: {
                    mode: 'dark',
                },

                colors: ['#28A0F0', 'rgba(61, 141, 255, 0.4)'],

                fill: {
                    type: ['solid', 'gradient'],

                    opacity: 0.9,

                    gradient: {
                        shade: ['dark'],
                        type: ["vertical"],
                        shadeIntensity: [1],
                        gradientToColors: ['rgba(17, 30, 55, 0.6)'],
                        opacityFrom: [1],
                        opacityTo: [1],
                        stops: [0, 100],
                        colorStops: []
                    },
                }
            };

            this.chart = new ApexCharts(document.querySelector("#line-chart-dist"), options);
            this.chart.render();
        },
    }
}
</script>

<style>

.chart-title {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 300 !important;
    font-size: 24px !important;
    line-height: 36px !important;
    letter-spacing: 0.04em !important;
    color: #FFFFFF !important;
}

.legend-row {
    height: 20px !important;
}

.chart-header-row {
    height: 120px !important;
}

.chart-row {
    height: 270px !important;
}

.dist-chart-container {
    height: 428px !important;
}

.yaxis-label {
    font-size: 12px !important;
    line-height: 12px !important;
    font-weight: 400;
    fill: rgba(255, 255, 255, 0.6) !important;
}

#line-chart-dist {
    overflow-x: hidden !important;
    overflow-y: hidden !important;
}

.yaxis-label {
    display: none !important;
}

.chart-header-row, .chart-row, .legend-row {
    margin-left: 28px;
    margin-right: 28px;
}

.legend-row {
    margin-bottom: 44px !important;
}

.header-text-row {
    margin-left: 28px !important;
    margin-right: 28px !important;
}

.header-text-row {
    margin-top: 28px !important;
}

.legend-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 300 !important;
    font-size: 16px !important;
    line-height: 24px !important;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: #FFFFFF;

    margin-left: 8px;
}

.solid-legend {
    background: linear-gradient(91.26deg, #28A0F0 0%, rgba(6, 120, 196, 0.9917) 100%);
    width: 32px;
    height: 6px;
    margin-top: 9px;
}

.dash-legend {
    width: 32px;
    height: 0;
    border: 2px dashed #3D8DFF;
    margin-top: 11px;
    margin-left: 20px;
}

</style>