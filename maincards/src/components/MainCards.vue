<template>
    <v-container class="main">
        <v-row>
            <v-col>
                <MainCardPcv label="Protocol Controlled Value" :value="tvl"/>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <MainCardApy label="Average USD+ APY" :value="apyWeek"/>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>

import MainCardPcv from "./card/MainCardPcv";
import MainCardApy from "./card/MainCardApy";
export default {
    name: 'MainCards',

    components: {
        MainCardPcv,
        MainCardApy,
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
                this.tvl = '$ ' + this.$utils.formatMoneyComma(value.tvl, 2);
            } else {
                this.tvl = '—';
            }

            if (value.apyWeek) {
                this.apyWeek = this.$utils.formatMoney(value.apyWeek, 0) + '%';
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
