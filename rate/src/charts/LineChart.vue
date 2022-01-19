<template>
    <div>
        <v-row style="margin-bottom: 0; margin-top: 5px;">
            <v-spacer></v-spacer>
            <v-btn
                    id="week-zoom-btn"
                    class="zoom-btn"
                    dark x-small outlined
                    @click="zoomChart('week')"
            >
                <label>Week</label>
            </v-btn>
            <v-btn
                    id="month-zoom-btn"
                    class="zoom-btn"
                    dark x-small outlined
                    @click="zoomChart('month')"
            >
                Month
            </v-btn>
            <v-btn
                    id="all-zoom-btn"
                    class="zoom-btn"
                    dark x-small outlined
                    @click="zoomChart('all')"
            >
                All
            </v-btn>
        </v-row>
        <div id="line-chart"></div>
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
        zoom: "all",
        slice: null,
        chart: null,
    }),

    computed: {
        ...mapGetters([]),
    },

    mounted() {
        this.redraw();
    },

    created() {
    },

    methods: {
        ...mapActions([]),

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
            document.getElementById("week-zoom-btn").classList.remove("selected");
            document.getElementById("month-zoom-btn").classList.remove("selected");
            document.getElementById("all-zoom-btn").classList.remove("selected");

            document.getElementById(this.zoom + "-zoom-btn").classList.add("selected");
        },

        redraw() {

            this.changeZoomBtnStyle();

            let values = [];
            this.data.datasets[0].data.forEach(v => values.push(v));
            values = this.slice ? values.slice(this.slice) : values;

            let labels = [];
            this.data.labels.forEach(v => labels.push(v));
            labels = this.slice ? labels.slice(this.slice) : labels;

            let averageValue = values.reduce((a, b) => (a + b)) / values.length;
            averageValue = averageValue.toFixed(1);

            let options = {
                series: [{
                    name: "Rate",
                    data: values
                }],

                labels: labels,

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

                annotations: {
                    position: 'back',
                    yaxis: [{
                        y: averageValue,
                        strokeDashArray: 6,
                        borderColor: 'rgba(252, 202, 70)',
                        fillColor: 'rgba(252, 202, 70)',
                        label: {
                            borderWidth: 0,
                            borderRadius: 0,
                            textAnchor: 'start',
                            position: 'left',
                            text: "AVG " + averageValue + "%",
                            offsetX: 5,
                            offsetY: -5,
                            style: {
                                background: 'rgba(252, 202, 70, 0.2)',
                                cssClass: 'annotation-label',
                            },
                        },
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
                    width: 1,
                    colors: ["#51FF00"],
                },

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
                        formatter: (value) => {
                            return value + '%'
                        },
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

            this.chart = new ApexCharts(document.querySelector("#line-chart"), options);
            this.chart.render();
        },
    }
}
</script>

<style>

#line-chart {
    overflow-x: auto !important;
    overflow-y: hidden !important;
}

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

.zoom-btn {
    margin-right: 5px;
    border-color: rgba(0, 0, 0, 0) !important;
}

.selected {
    border-color: white !important;
}

.apexcharts-yaxis-annotations > line {
    border-width: 0px !important;
    stroke-width: 2px !important;
    stroke: rgba(252, 202, 70, 0.3) !important;
    stroke-linecap: round !important;
}

.annotation-label {
    fill: rgba(252, 202, 70, 1) !important;
    font-size: 12px !important;
}

</style>