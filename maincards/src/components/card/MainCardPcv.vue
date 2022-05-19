<template>
    <div class="main-card-container">
        <div class="shield-img">
            <svg width="198" height="234" viewBox="0 0 198 234" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M111.789 256C111.789 256 6 229.604 6 45.8492C41.2629 42.9955 75.8125 39.0208 111.789 6C147.765 38.9189 182.315 42.9955 217.578 45.8492C217.68 229.604 111.789 256 111.789 256Z"
                      stroke="url(#paint0_linear_193_7303)" stroke-width="12" stroke-miterlimit="10"
                      stroke-linecap="round"
                      stroke-linejoin="round"/>
                <defs>
                    <linearGradient id="paint0_linear_193_7303" x1="6" y1="6" x2="287.564" y2="155.492"
                                    gradientUnits="userSpaceOnUse">
                        <stop stop-color="#052758"/>
                        <stop offset="1" stop-color="#181720"/>
                    </linearGradient>
                </defs>
            </svg>
        </div>

        <v-row class="value-row" align="center">
            <label class="value-label">
                {{ value }}
            </label>
            <div class="network-img-container">
                <img class="network-img-polygon" width="40px" alt="Polygon logo"
                     :src="require('../../assets/networks/polygon.svg')">
            </div>
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
    name: "MainCardPcv",

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

.shield-img {
    position: absolute;
    margin-left: 328px;
    margin-top: 18px;
}

.shield-img > svg > path {
    stroke-dasharray: 1000;
    stroke-dashoffset: 1000;
    animation: dash 4s linear forwards;
}

@keyframes dash {
    to {
        stroke-dashoffset: 0;
    }
}

.network-img-container {
    height: 40px !important;
    margin-left: 22px !important;
    margin-top: 5px !important;
}

.network-img-polygon {
    cursor: pointer !important;
}

.network-img-fantom {
    margin-left: 20px !important;
    filter: brightness(60%) grayscale(80%);
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

.value-label, .text-label {
    z-index: 100 !important;
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