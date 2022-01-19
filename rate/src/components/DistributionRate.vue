<template>
    <div class="main">
        <div>
            <img width="37px" alt="Ovn logo" src="../assets/ovn.png">
            <label class="title" @click="clickLogo">
                Overnight<sup>&reg;</sup>
                <div class="rectangle"></div>
                USD+ Daily APY Distribution
            </label>
        </div>

        <template v-if="chartdata">
            <LineBarChart :data="chartdata"/>
        </template>
        <template v-else>
            <div class="loader"></div>
        </template>
        <div class="signature" @click="clickLogo">
            <div class="powered-by">Powered by</div>
            <div class="powered">ovnstable.io</div>
        </div>
    </div>
</template>

<script>
import LineBarChart from "@/charts/LineBarChart";

export default {
    name: 'InterestRate',
    components: {
        LineBarChart,
    },
    props: {
        msg: String
    },


    data: () => ({
        loading: true,
        chartdata: null,
    }),

    computed: {},


    created() {
        this.getData();
    },

    methods: {

        fillData(value) {
            let labels = [];
            let ovnDist = [];
            let normalDist = [];


            for (let i = 0; i < value.length; i++) {
                let element = value[i];
                labels.push(element.label)
                ovnDist.push(element.ovnDist)
                normalDist.push(element.normalDist)
            }

            let result = {
                labels: labels,
                datasets: [{
                    type: 'line',
                    fill: false,
                    label: 'Normal Distribution',
                    data: normalDist,
                    order: 1,
                }, {
                    type: 'column',
                    order: 2,
                    label: 'Overnight rate distribution',
                    data: ovnDist,
                }],
            }

            this.chartdata = result;
        },

        getData() {

            let fetchOptions = {
                headers: {
                    "Access-Control-Allow-Origin": process.env.VUE_APP_WIDGET_API_URL
                }
            };

            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/distribution-rate', fetchOptions)
                .then(value => value.json())
                .then(value => {
                    this.fillData(value)
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        clickLogo() {
            window.open(process.env.VUE_APP_GO_TO_URL, '_blank').focus();
        },
    }
}
</script>


<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap');

.title {
    font-family: 'Raleway', sans-serif;
    font-size: 32px;
    color: white;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
    vertical-align: super;
}

.title > sup {
    font-size: 8px;
    vertical-align: super;
}

.signature {
    margin-top: 10px;
    cursor: pointer;
}

.rectangle {
    display: inline-block;
    vertical-align: sub;
    position: static;
    width: 3px;
    height: 32px;

    background: #FE7F2D;
    border-radius: 4px;

    flex: none;
    order: 1;
    flex-grow: 0;

    margin-right: 3px;
    margin-left: 8px;
}

.powered {
    font-weight: 500;
    font-size: 15px;
    color: white;
    margin-right: 5px;
}

.powered-by {
    font-weight: 500;
    font-size: 15px;
    color: #808a9d;
    margin-right: 5px;
}

.loader {
    margin-left: auto;
    margin-right: auto;
    margin-top: 5px;
    border: 5px solid #f3f3f3; /* Light grey */
    border-top: 5px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 20px;
    height: 20px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

a:link {
    color: #131313;
    text-decoration: none;
}

a:visited {
    color: #131313;
    text-decoration: none;
}

.main {
    font-style: normal;
    width: 100%;
    padding: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;

    border-radius: 10px;
    background-color: #0F1A26;

    text-align: center;
}

</style>
