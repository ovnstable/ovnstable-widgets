<template>
    <div class="main-card-container">
        <v-row class="title-row">
            <v-spacer></v-spacer>
            <label class="card-title-label">{{ title }}</label>
            <v-spacer></v-spacer>
        </v-row>
        <v-row class="doughnut-row">
            <v-spacer></v-spacer>
            <vc-donut
                    background="none"
                    :size="250" unit="px"
                    :sections="sections"
                    :start-angle="0" :auto-adjust-text-size="false">
            </vc-donut>
            <v-spacer></v-spacer>
        </v-row>
        <v-container class="strategy-row-list">
            <v-row class="strategy-row" justify="center">
                <v-col v-for="item in data" v-bind:key="item.label"  class="img-label-col">
                    <v-img class="currency-icon" :src="item.logo"/>
                    <label class="stablecoin-label">{{ item.label }}</label>
                    <label class="stablecoin-label-percent">{{ $utils.formatMoneyComma(getPercent(item, data), 0) }}%</label>
                </v-col>
            </v-row>
        </v-container>
    </div>
</template>

<script>

export default {
    name: "StablecoinsCard",

    props: {
        title: {
            type: String,
            default: null,
        },

        data: {
            type: Array,
            default: null,
        },
    },

    components: {},

    data: () => ({
        sections: [],
    }),

    computed: {},

    mounted() {
        this.updateSectionsData();
    },

    created() {
        this.updateSectionsData();
    },

    methods: {
        getPercent(item, data) {
            let sum = data.map(dataItem => dataItem.value).reduce((prev, next) => prev + next);

            return (item.value * 100 / sum) - 0;
        },

        updateSectionsData() {
            this.sections = [];

            this.data.forEach(item => {
                this.sections.push(
                    {
                        color: item.color,
                        label: item.label,
                        value: this.getPercent(item, this.data),
                    }
                )
            });
        },
    }
}
</script>

<style scoped>

.main-card-container {
    border: 1px solid #DEE1E5 !important;
    background: #FFFFFF !important;
    min-height: 490px !important;
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

.stablecoin-label, .stablecoin-label-percent {
    font-family: 'Roboto', sans-serif;
    font-style: normal;
    font-weight: 300;
    font-size: 20px;
    line-height: 32px;
    color: #333333;

    margin-left: 8px !important;
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
    margin-left: 77px !important;
    margin-right: 77px !important;
}

.currency-icon {
    width: 32px;
    height: 32px;
}

.img-label-col {
    display: -webkit-inline-box;
}

</style>