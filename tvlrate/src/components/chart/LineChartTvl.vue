<template>
    <v-container class="tvl-chart-container">
        <v-row class="chart-header-row">
            <v-col cols="12">
                <v-row class="header-text-row">
                    <label class="chart-title">{{ totalUsdPlusValue ? 'USD+ TVL' : '' }}</label>
                    <v-spacer></v-spacer>
                    <label class="chart-title-tvl">
                        {{ totalUsdPlusValue ? ('$' + $utils.formatMoneyComma(totalUsdPlusValue, 2)) : '' }}
                    </label>
                </v-row>
                <v-row class="header-text-sub-row">
                    <v-spacer></v-spacer>
                    <label class="chart-sub-title-tvl">
                        {{ totalUsdPlusValue ? 'past 24 hours' : '' }}
                    </label>
                </v-row>
            </v-col>
        </v-row>

        <div class="chart-row" id="line-chart-tvl"></div>

        <v-row class="zoom-row">
            <v-spacer></v-spacer>
            <v-btn
                    text
                    id="week-zoom-btn-tvl"
                    class="zoom-btn"
                    dark
                    @click="zoomChart('week')"
            >
                <label>Week</label>
            </v-btn>
            <v-btn
                    text
                    id="month-zoom-btn-tvl"
                    class="zoom-btn"
                    dark
                    @click="zoomChart('month')"
            >
                Month
            </v-btn>
            <v-btn
                    text
                    id="all-zoom-btn-tvl"
                    class="zoom-btn"
                    dark
                    @click="zoomChart('all')"
            >
                All
            </v-btn>
        </v-row>
    </v-container>
</template>

<script>
/* eslint-disable no-unused-vars,no-undef */

import {mapActions, mapGetters, mapMutations} from "vuex";

import ApexCharts from 'apexcharts'

export default {
    name: "LineChartTvl",

    props: {
        data: {
            type: Object,
            default: null,
        },

        totalUsdPlusValue: {
            type: Number,
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
        zoom: "all",
        slice: null,
        chart: null,
    }),

    computed: {
    },

    mounted() {
        this.redraw();
    },

    created() {
        this.zoomChart("all");
    },

    methods: {
        ...mapMutations([]),

        zoomChart(zoom) {
            this.zoom = zoom;

            switch (zoom) {
                case "week":
                    this.slice = -7;
                    break;
                case "month":
                    this.slice = -30;
                    break;
                case "all":
                    this.slice = null;
                    break;
                default:
                    this.slice = null;
            }

            if (this.chart) {
                this.chart.destroy();
            }

            this.redraw();
        },

        changeZoomBtnStyle() {
            document.getElementById("week-zoom-btn-tvl").classList.remove("selected");
            document.getElementById("month-zoom-btn-tvl").classList.remove("selected");
            document.getElementById("all-zoom-btn-tvl").classList.remove("selected");

            document.getElementById(this.zoom + "-zoom-btn-tvl").classList.add("selected");
        },

        redraw() {
            if (this.chart) {
                this.chart.destroy();
            }

            this.changeZoomBtnStyle();

            let values = [];
            this.data.datasets[0].data.forEach(v => values.push(v));
            values = this.slice ? values.slice(this.slice) : values;

            let labels = [];
            this.data.labels.forEach(v => labels.push(v));
            labels = this.slice ? labels.slice(this.slice) : labels;

            let maxValue;
            try {
                maxValue = Math.max.apply(Math, values);
                maxValue = Math.round(Math.ceil(maxValue / 10)) * 10;
            } catch (e) {
                maxValue = 50;
            }

            let options = {
                series: [{
                    name: "TVL",
                    data: values
                }],

                labels: labels,

                chart: {
                    type: 'area',
                    height: 250,
                    width: 760,

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
                    width: 2,
                    colors: ["#3D8DFF"],
                },

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
                    max: maxValue,

                    labels: {
                        show: false,
                    },
                },

                legend: {
                    horizontalAlign: 'left'
                },

                theme: {
                    mode: 'dark',
                },

                fill: {
                    colors: ['rgba(61, 141, 255, 0.4)'],
                    opacity: 1,
                    type: 'gradient',
                    gradient: {
                        shade: 'dark',
                        type: "vertical",
                        shadeIntensity: 1,
                        gradientToColors: ['rgba(17, 30, 55, 0.6)'],
                        opacityFrom: 1,
                        opacityTo: 1,
                        stops: [0, 100],
                        colorStops: []
                    },
                }
            };

            this.chart = new ApexCharts(document.querySelector("#line-chart-tvl"), options);
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

.chart-title-tvl {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400 !important;
    font-size: 40px !important;
    line-height: 44px !important;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: #FFFFFF !important;
}

.chart-sub-title-tvl {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400 !important;
    font-size: 18px !important;
    line-height: 28px !important;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: #707A8B !important;
}

.zoom-row {
    height: 20px !important;
}

.chart-header-row {
    height: 150px !important;
}

.chart-row {
    height: 275px !important;
}

.tvl-chart-container {
    height: 428px !important;
}

.yaxis-label {
    font-size: 12px !important;
    line-height: 12px !important;
    font-weight: 400;
    fill: rgba(255, 255, 255, 0.6) !important;
}

#line-chart-tvl {
    overflow-x: hidden !important;
    overflow-y: hidden !important;
}

.yaxis-label {
    display: none !important;
}

.zoom-btn {
    height: 32px !important;
    border: none !important;
    font-family: 'Roboto', sans-serif !important;
    font-style: normal !important;
    font-weight: 300 !important;
    font-size: 16px !important;
    line-height: 24px !important;
    color: #707A8B !important;
    letter-spacing: 0 !important;
}

.selected {
    color: #28A0F0 !important;
    background-color: rgba(95, 151, 255, 0.15);
    border-radius: 0 !important;
}

.zoom-btn:hover {
    border-radius: 0 !important;
}

.chart-header-row, .chart-row, .zoom-row {
    margin-left: 28px;
    margin-right: 28px;
}

#all-zoom-btn-tvl {
    margin-right: 40px !important;
}

.zoom-row {
    margin-top: -50px !important;
}

.header-text-row, .header-text-sub-row {
    margin-left: 28px !important;
    margin-right: 28px !important;
}

.header-text-sub-row {
    padding-top: 8px !important;
}

.header-text-row {
    margin-top: 28px !important;
}

</style>