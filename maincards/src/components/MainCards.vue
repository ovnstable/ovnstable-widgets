<template>
    <v-container class="main">
        <v-row>
            <v-col cols="6">
                <MainCard label="Total value locked" :value="tvl"/>
            </v-col>

            <v-col cols="6">
                <MainCard label="Average USD+ APY" :value="apyWeek"/>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>

import MainCard from "./card/MainCard";
export default {
    name: 'MainCards',

    components: {
        MainCard
    },

    props: {},

    data: () => ({
        tvl: null,
        apyWeek: null,
    }),

    computed: {},

    created() {
        this.getMainCardsData();
    },

    methods: {

        fillData(value) {

            if (value.tvl) {
                this.tvl = '$' + this.$utils.formatMoneyComma(value.tvl, 0);
            } else {
                this.tvl = '—';
            }

            if (value.apyWeek) {
                this.apyWeek = this.$utils.formatMoney(value.apyWeek, 1) + '%';
            } else {
                this.apyWeek = '—';
            }
        },

        getMainCardsData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/maincards-info', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillData(value);
                }).catch(reason => {
                console.log('Error get data: ' + reason);
            })
        },
    }
}
</script>


<style scoped>

.main {
    font-style: normal;
    width: 100%;
    display: inline-block;

    background: none;
}

</style>
