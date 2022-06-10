<template>
    <v-container class="main">
        <v-row>
            <v-col>
                <MainCardPcv label="Protocol Controlled Value" :value="pcv"/>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <MainCardApy label="USD+ APY based on 7-day average" :value="apyWeek"/>
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
        pcv: null,
        apyWeek: null,
    }),

    computed: {},

    created() {
        this.getMainCardsData();
    },

    methods: {

        fillApyData(value) {

            if (value.value) {
                this.apyWeek = this.$utils.formatMoney(value.value, 1) + '%';
            } else {
                this.apyWeek = '—';
            }
        },

        fillPcvData(value) {

            if (value) {
                let sum = 0.0;

                for (let i = 0; i < value.length; i++) {
                    sum += value[i].netAssetValue;
                }

                this.pcv = '$ ' + this.$utils.formatMoneyComma(sum, 2);
            } else {
                this.pcv = '—';
            }
        },

        getMainCardsData() {
            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/avg-apy-info/week', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillApyData(value);
                }).catch(reason => {
                console.log('Error get data: ' + reason);
            });

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/dapp/strategies', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillPcvData(value);
                }).catch(reason => {
                console.log('Error get data: ' + reason);
            });
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
