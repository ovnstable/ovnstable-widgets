<!--suppress CssUnresolvedCustomProperty -->
<template>
    <div>
        <v-row>
            <v-col>
                <div :id="refer" :ref="refer" :style="'--background: ' + background"></div>
            </v-col>
            <v-col v-if="legend" style="margin-left: -50px; width: 220px">
                <div style="margin-top: 68px;">
                    <table style="border-collapse:separate; border-spacing: 0 10px; width: 100%">
                        <tr v-for="item in data" :key="item.title">
                            <td align="left">
                                <label @click="openInNewTab(item.link)"
                                   :style="{'color': item.color, 'font-size': fontSize + 'px', 'line-height': fontSize + 'px', 'cursor': item.link ? 'pointer' : 'default'}"
                                   style="text-decoration: none">
                                    {{ item.title }}
                                </label>
                            </td>
                            <td align="left">
                                <label :style="{'color': color, 'font-size': fontSize + 'px', 'line-height': fontSize + 'px'}">
                                    {{
                                        percentsOnly
                                                ? ('&nbsp;' + getPercent(item, data) + '%')
                                                : ('&nbsp;' + item.value + ' (' + getPercent(item, data) + '%)')
                                    }}
                                </label>
                            </td>
                        </tr>
                    </table>
                </div>
            </v-col>
        </v-row>
    </div>
</template>

<script>
/* eslint-disable no-unused-vars,no-undef */

import {mapActions, mapGetters, mapMutations} from "vuex";

import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/pie'

export default {
    name: "Doughnut",

    props: {
        refer: {
            type: String,
            default: "chart_div",
        },

        height: {
            type: Number,
            default: 400,
        },

        animated: {
            type: Boolean,
            default: false,
        },

        percentsOnly: {
            type: Boolean,
            default: false,
        },

        title: {
            type: String,
            default: "",
        },

        data: {
            type: Array,
            default: null,
        },

        diffuse: {
            type: Boolean,
            default: false,
        },

        dark: {
            type: Boolean,
            default: false,
        },

        color: {
            type: String,
            default: 'black',
        },

        background: {
            type: String,
            default: 'white',
        },

        legend: {
            type: Boolean,
            default: true,
        },

        callbackRefresh: {
            type: Function,
            default: function () {
            }
        },
    },

    watch: {
        refer: function (newVal, oldVal) {
            this.redraw();
        },

        height: function (newVal, oldVal) {
            this.redraw();
        },

        animated: function (newVal, oldVal) {
            this.redraw();
        },

        percentsOnly: function (newVal, oldVal) {
            this.redraw();
        },

        title: function (newVal, oldVal) {
            this.redraw();
        },

        data: function (newVal, oldVal) {
            this.redraw();
        },

        diffuse: function (newVal, oldVal) {
            this.redraw();
        },

        color: function (newVal, oldVal) {
            this.redraw();
        },

        background: function (newVal, oldVal) {
            this.redraw();
        },

        dark: function (newVal, oldVal) {
            this.redraw();
        },

        legend: function (newVal, oldVal) {
            this.redraw();
        },
    },

    components: {},

    data: () => ({
        color: 'red'
    }),

    computed: {
        ...mapGetters([
            'username',
        ]),

        fontSize() {
            return this.height / 20;
        },
    },

    mounted() {
        this.redraw();
    },

    created() {
    },

    methods: {
        ...mapActions([]),

        ...mapMutations([
            'setUsername',
        ]),

        getPercent(item, data) {
            let sum = data.map(dataItem => dataItem.value).reduce((prev, next) => prev + next);
            return (item.value * 100 / sum).toFixed(1);
        },

        redraw() {
            this.$refs[this.refer].style.height = this.height + "px";
            this.$refs[this.refer].style.width = this.height + "px";

            let chart = AmCharts.makeChart(this.refer,
                {
                    "type": "pie",

                    "hideCredits": true,

                    "theme": "default",

                    "innerRadius": "80%",

                    "gradientRatio": this.diffuse ? (this.dark ? [-1, -1, -0.75, -0.5, 0] : [1, 1, 0.75, 0.5, 0]) : [],

                    "backgroundColor": "rgba(0, 0, 0, 0)",

                    "backgroundAlpha": 0,

                    "alpha": this.diffuse ? 0.75 : 1,

                    "labelsEnabled": false,

                    "balloonText": "",

                    "sequencedAnimation": false,
                    "startEffect": "easeInSine",
                    "startDuration": this.animated ? 0.5 : 0,
                    "startRadius": "50%",

                    "dataProvider": this.data,

                    "fontFamily": "'Raleway', sans-serif",

                    "valueField": "value",
                    "colorField": "color",
                    "titleField": "title",
                }
            );

            chart.addLabel(
                0,
                this.height / 2 - (this.height * 3 / 20 / 4),
                this.title,
                "center",
                this.fontSize,
                this.color,
                0,
                1,
                false,
                null
            );

            this.callbackRefresh();
        },

        openInNewTab(url) {
            if (url && url !== '') {
                window.open(url, '_blank').focus();
            }
        }
    }
}
</script>

<style>

stop:not(:last-child) {
    /*stop-color: var(--background) !important;*/
    stop-color: rgba(0, 0, 0, 0) !important;
}

</style>