<template>
    <div>
        <div id="line-bar-chart"></div>
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

    data: () => ({}),

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

        redraw() {

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
                        borderRadius: 15,
                    }
                },

                chart: {
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
                    curve: 'smooth',
                    width: [0, 2],
                    colors: ["#48e400", "#FCCA46"],
                },

                labels: labels,

                xaxis: {
                    type: 'category',

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
                    show: true,
                    position: 'bottom',
                    horizontalAlign: 'center',
                    fontSize: '18px',
                    fontFamily: "'Raleway', sans-serif",
                    fontWeight: "normal",
                },

                colors: ["#48e400", "#FCCA46"],

                theme: {
                    mode: 'dark',
                },

                fill: {
                    type: ['solid', 'gradient'],

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

            let chart = new ApexCharts(document.querySelector("#line-bar-chart"), options);
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