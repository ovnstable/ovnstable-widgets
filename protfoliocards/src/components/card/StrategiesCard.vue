<template>
    <div class="main-card-container">
        <v-row class="title-row">
            <v-spacer></v-spacer>
            <label class="card-title-label">{{ title }}</label>
            <v-spacer></v-spacer>
        </v-row>
        <v-row class="doughnut-row">
            <v-spacer></v-spacer>
            <!-- TODO: add strategies doughnut -->
            LALALA
            <v-spacer></v-spacer>
        </v-row>
        <v-container class="strategy-row-list">
            <v-row class="strategy-row">
                LALALA
                <v-spacer></v-spacer>
                LALALA
            </v-row>
        </v-container>
    </div>
</template>

<script>

export default {
    name: "StrategiesCard",

    props: {
        title: {
            type: String,
            default: null,
        },

        data: {
            type: Array,
            default: null,
        },

        totalUsdPlusValue: {
            type: Number,
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

.main-card-container {
    border: 1px solid #DEE1E5 !important;
    background: #FFFFFF !important;
    min-height: 768px !important;
    width: 663px !important;
}

.card-title-label {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 24px;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    font-feature-settings: 'pnum' on, 'lnum' on;
    color: #333333;
}

.title-row {
    margin-top: 60px !important;
}

.doughnut-row {
    padding-top: 32px !important;
}

.strategy-row-list {
    margin-top: 44px !important;
}

.strategy-row {
    margin-left: 88px !important;
    margin-right: 88px !important;
}

</style>