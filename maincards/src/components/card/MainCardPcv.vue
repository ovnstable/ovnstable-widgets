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

        <div class="shield-img-mobile">
            <svg width="95" height="156" viewBox="0 0 95 156" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M75.2796 169.507C75.2796 169.507 6.22583 152.277 6.22583 32.3304C29.2438 30.4677 51.796 27.8732 75.2796 6.31885C98.7633 27.8067 121.315 30.4677 144.333 32.3304C144.4 152.277 75.2796 169.507 75.2796 169.507Z" stroke="url(#paint0_linear_753_145324)" stroke-width="12" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                <defs>
                    <linearGradient id="paint0_linear_753_145324" x1="-14.0095" y1="15.131" x2="127.286" y2="58.7823" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#052758"/>
                        <stop offset="1" stop-color="#071025"/>
                    </linearGradient>
                </defs>
            </svg>
        </div>

        <v-row class="value-row">
            <label class="value-label">
                {{ value }}
            </label>
            <div class="network-img-container">
                <img class="network-img-polygon" alt="Polygon logo"
                     @click="openOnPolygon"
                     :src="require('../../assets/networks/polygon.png')">
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

    methods: {
        openOnPolygon() {
            window.open('https://polygonscan.com/address/0x236eeC6359fb44CCe8f97E99387aa7F8cd5cdE1f', '_blank').focus();
        }
    }
}
</script>

<style scoped>

/* mobile */
@media only screen and (max-width: 1400px) {
    .value-label {
        font-style: normal;
        font-weight: 400;
        font-size: 40px;
        line-height: 42px;
    }

    .text-label {
        font-weight: 400;
        font-size: 16px;
        line-height: 24px;
        letter-spacing: 0.04em !important;
    }

    .network-img-container {
        height: 32px !important;
        margin-left: 16px !important;
    }

    .network-img-polygon {
        width: 32px !important;
    }

    .main-card-container {
        min-height: 166px !important;
        width: 344px !important;
    }

    .value-row, .label-row {
        margin-left: 25px !important;
    }

    .value-row {
        margin-top: 47px !important;
        margin-bottom: 12px !important;
    }

    .shield-img {
        display: none !important;
    }

    .shield-img-mobile {
        margin-left: 248px;
        margin-top: 9px;
    }
}

@media only screen and (min-width: 1400px) {
    .value-label {
        font-style: normal;
        font-weight: 400;
        font-size: 54px;
        line-height: 60px;
    }

    .text-label {
        font-style: normal;
        font-weight: 400;
        font-size: 20px;
        line-height: 24px;
        letter-spacing: 0.04em !important;
    }

    .network-img-container {
        height: 40px !important;
        margin-left: 22px !important;
    }

    .network-img-polygon {
        width: 40px !important;
    }

    .main-card-container {
        min-height: 254px !important;
        width: 527px !important;
    }

    .value-row, .label-row {
        margin-left: 44px !important;
    }

    .value-row {
        margin-top: 76px !important;
        margin-bottom: 22px !important;
    }

    .shield-img {
        margin-left: 328px;
        margin-top: 18px;
    }

    .shield-img-mobile {
        display: none !important;
    }
}

.shield-img, .shield-img-mobile {
    position: absolute;
}

.shield-img > svg > path, .shield-img-mobile > svg > path {
    stroke-dasharray: 1000;
    stroke-dashoffset: 1000;
    animation: dash 4s linear forwards;
}

@keyframes dash {
    to {
        stroke-dashoffset: 0;
    }
}

.network-img-polygon {
    cursor: pointer !important;
}

.main-card-container {
    border: 1px solid #29323E !important;
    background: #0A1632 !important;
}

.value-label {
    font-family: 'Roboto', sans-serif;
    font-feature-settings: 'pnum' on, 'lnum' on;
    background: linear-gradient(91.26deg, #28A0F0 0%, rgba(6, 120, 196, 0.9917) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;
}

.text-label {
    font-family: 'Roboto', sans-serif;
    text-transform: uppercase;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: white;
}

.value-label, .text-label, .network-img-container {
    z-index: 100 !important;
}
</style>