<template>
    <div class="main-card-container">
        <div class="arrow-img">
            <svg width="226" height="221" viewBox="0 0 226 221" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M65.4999 112.5L68.6375 107.386L62.7726 103.788L60.0062 110.088L65.4999 112.5ZM147 162.5L143.862 167.614L149.731 171.215L152.495 164.908L147 162.5ZM218 0.499509L162.188 41.5481L225.643 69.3587L218 0.499509ZM11.4936 250.412L70.9936 114.912L60.0062 110.088L0.506199 245.588L11.4936 250.412ZM62.3623 117.614L143.862 167.614L150.137 157.386L68.6375 107.386L62.3623 117.614ZM152.495 164.908L201.819 52.3665L190.828 47.5495L141.504 160.092L152.495 164.908Z"
                      fill="url(#paint0_linear_211_6198)"/>

                <animate attributeName="fill" values="url(#paint0_linear_211_6198)" dur="2s" />

                <defs>
                    <linearGradient id="paint0_linear_211_6198" x1="5.99988" y1="0.499512" x2="286.622" y2="151.297"
                                    gradientUnits="userSpaceOnUse">
                        <stop offset="0%" stop-color="#15141D">
                            <animate attributeName="stop-color" values="#15141D; #052758; #15141D" dur="2s" repeatCount="indefinite"></animate>
                        </stop>
                        <stop offset="100%" stop-color="#052758">
                            <animate attributeName="stop-color" values="#052758; #15141D; #052758" dur="2s" repeatCount="indefinite"></animate>
                        </stop>
                    </linearGradient>
                </defs>
            </svg>
        </div>

        <v-row class="value-row">
            <label class="value-label">
                {{ value }}
            </label>
            <v-spacer></v-spacer>
        </v-row>

        <v-row class="label-row">
            <label class="text-label">
                {{ label }}
            </label>
        </v-row>
    </div>
</template>

<script>

export default {
    name: "MainCardApy",

    props: {
        label: {
            type: String,
            default: null,
        },

        value: {
            type: String,
            default: null,
        },
    },

    components: {},

    data: () => ({}),

    computed: {},

    mounted() {
    },

    created() {
    },

    methods: {}
}
</script>

<style scoped>

.arrow-img {
    position: absolute;
    margin-left: 270px;
    margin-top: 32px;
}

.arrow-img > svg > path {
    stroke-dasharray: 1000;
    stroke-dashoffset: 1000;
    animation: dash-arrow 5s linear forwards;
}

@keyframes dash-arrow {
    to {
        stroke-dashoffset: 0;
    }
}

.main-card-container {
    border: 1px solid #29323E !important;
    background: #0A1632 !important;
    min-height: 254px !important;
    width: 527px !important;
}

.value-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 54px;
    line-height: 60px;

    font-feature-settings: 'pnum' on, 'lnum' on;

    background: linear-gradient(91.26deg, #28A0F0 0%, rgba(6, 120, 196, 0.9917) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;
}

.text-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 24px;

    letter-spacing: 0.04em !important;

    text-transform: uppercase;
    font-feature-settings: 'pnum' on, 'lnum' on;

    color: white;
}

.value-row {
    margin-top: 76px !important;
    margin-left: 44px !important;
    margin-bottom: 22px !important;
}

.label-row {
    margin-left: 44px !important;
}
</style>