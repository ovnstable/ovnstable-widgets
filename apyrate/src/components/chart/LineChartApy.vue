<template>
    <v-container class="apy-chart-container">
        <v-row class="chart-header-row mb-0">
            <v-col cols="12">
                <v-row class="header-text-row">
                    <label class="chart-title">{{ avgApy ? 'Average USD+ APY' : '' }}</label>

                    <v-spacer></v-spacer>

                    <label class="chart-title-apy">
                        {{ (avgApy && avgApy.value) ? ($utils.formatMoneyComma(avgApy.value, 1)) + '%' : '' }}
                    </label>
                </v-row>
                <v-row class="header-text-sub-row">
                    <v-spacer></v-spacer>

                    <label class="chart-sub-title-apy">
                        {{ (avgApy && avgApy.date) ? 'from ' + avgApy.date : '' }}
                    </label>
                </v-row>
            </v-col>
        </v-row>

        <div class="chart-row" id="line-chart-apy"></div>

        <v-row class="zoom-row">
            <v-spacer></v-spacer>
            <v-btn
                    text
                    id="week-zoom-btn-apy"
                    class="zoom-btn"
                    dark
                    @click="zoomChart('week')"
            >
                <label>Week</label>
            </v-btn>
            <v-btn
                    text
                    id="month-zoom-btn-apy"
                    class="zoom-btn"
                    dark
                    @click="zoomChart('month')"
            >
                Month
            </v-btn>
            <v-btn
                    text
                    id="all-zoom-btn-apy"
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
import moment from "moment";

export default {
    name: "LineChartApy",

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
        zoom: "all",
        slice: null,
        chart: null,

        avgApy: null,
    }),

    computed: {
    },

    mounted() {
        this.redraw();
    },

    created() {
        this.zoomChart("month");
    },

    methods: {
        ...mapMutations([]),

        async zoomChart(zoom) {

            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            await fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/avg-apy-info/' + zoom, fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.avgApy = value;
                    this.avgApy.date = moment(this.avgApy.date).format("DD MMM. ‘YY");
                }).catch(reason => {
                    console.log('Error get data: ' + reason);
                })

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
            document.getElementById("week-zoom-btn-apy").classList.remove("selected");
            document.getElementById("month-zoom-btn-apy").classList.remove("selected");
            document.getElementById("all-zoom-btn-apy").classList.remove("selected");

            document.getElementById(this.zoom + "-zoom-btn-apy").classList.add("selected");
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

            let averageValue = this.avgApy.value;

            let maxValue;
            try {
                maxValue = Math.max.apply(Math, values);
                maxValue = Math.round(Math.ceil(maxValue / 10)) * 10;
            } catch (e) {
                maxValue = 50;
            }

            let options = {
                series: [{
                    name: "APY",
                    data: values
                }],

                labels: labels,

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

                annotations: {
                    position: 'front',
                    yaxis: [{
                        y: averageValue,
                        strokeDashArray: 4,
                        borderColor: '#3D8DFF',
                        fillColor: '#3D8DFF',
                        label: {
                            show: false,
                        },
                        width: this.isMobile ? '0%' : '100%',
                    }]
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

            this.chart = new ApexCharts(document.querySelector("#line-chart-apy"), options);
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

.chart-title-apy {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400 !important;
    font-size: 40px !important;
    line-height: 44px !important;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: #FFFFFF !important;
}

.chart-sub-title-apy {
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

.apy-chart-container {
    height: 428px !important;
}

.yaxis-label {
    font-size: 12px !important;
    line-height: 12px !important;
    font-weight: 400;
    fill: rgba(255, 255, 255, 0.6) !important;
}

#line-chart-apy {
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

#all-zoom-btn-apy {
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