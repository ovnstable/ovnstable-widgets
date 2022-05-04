<template>
    <div fluid class="main-card-container">
        <v-row class="value-row">
            <v-spacer></v-spacer>
            <label class="value-label">
                {{ value }}
            </label>
            <v-spacer></v-spacer>
        </v-row>

        <v-row class="label-row">
            <v-spacer></v-spacer>
            <label class="text-label">
                {{ label }}
            </label>
            <v-spacer></v-spacer>
        </v-row>
    </div>
</template>

<script>

export default {
    name: "MainCard",

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

    computed: {
    },

    mounted() {
    },

    created() {
    },

    methods: {
    }
}
</script>

<style>

.main-card-container {
    border: 1px solid #4C586D !important;
    background: #0A1632 !important;
}

.value-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 54px;
    line-height: 60px;

    font-feature-settings: 'pnum' on, 'lnum' on;
}

.text-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 28px;

    letter-spacing: 0.1em !important;

    text-transform: uppercase;
    font-feature-settings: 'pnum' on, 'lnum' on;
}

.value-label, .text-label {
    background: linear-gradient(91.26deg, #28A0F0 0%, rgba(6, 120, 196, 0.9917) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;
}

.value-row {
    margin-top: 63px !important;
    margin-bottom: 13px !important;
}

.label-row {
    /*margin-top: 13px !important;*/
}
</style>