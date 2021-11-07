<template>
    <div class="main">
        <div>
            <img alt="Ovn logo" src="../assets/ovn.png">
        </div>
        <div class="title" @click="clickLogo">
            <a class="link">Polybor Overnight Interest Rate Benchmark</a>
        </div>

        <template v-if="chartdata">
            <line-chart :chartdata="chartdata" :options="options"/>
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
import LineChart from "../charts/LineChart";

export default {
    name: 'InterestRate',
    components: {LineChart},
    props: {
        msg: String
    },


    data: () => ({
        loading: true,
        chartdata: null,

        options: {
            responsive: true,
            maintainAspectRatio: false,
            elements: {
                line: {
                    tension: 0
                }
            },
            legend: {
                display: false
            },
            tooltips: {
                enabled: false
            }
        },

    }),

    computed: {},


    created() {
        this.getData();
    },

    methods: {

        fillData(value) {


            let labels = [];
            let data = [];


            for (let i = 0; i < value.length; i++) {
                let element = value[i];
                labels.push(element.date)
                data.push(element.value)
            }

            let result = {
                labels: labels,
                datasets: [
                    {
                        fill: false,
                        borderColor: '#69a5fd',
                        data: data,
                    }
                ]
            }

            this.chartdata = result;

        },

        getData() {

            // fetch('https://app.ovnstable.io/api/widget/interest-rate')
            fetch('http://localhost:3000/api/widget/interest-rate')
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
            window.open('https://app.ovnstable.io/fund', '_blank').focus();
        },
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.signature {
    margin-top: 10px;
    cursor: pointer;
}

.powered {
    font-weight: 500;
    font-size: 15px;
    color: #111111;
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

.up {
    background-color: #16c784 !important;
}


a:link {
    color: #131313;
    text-decoration: none;
}

a:visited {
    color: #131313;
    text-decoration: none;
}

.changes {
    height: 21px;
    display: inline-block;
    align-items: center;
    font-weight: 600;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    font-size: 12px;
    line-height: 21px;
    color: #fff;
    border-radius: 8px;
    padding: 0px 6px;
    background-color: #ea3943;
}

.main {
    font-style: normal;
    width: 100%;
    padding: 16px;
    background: #fff;
    border-radius: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;
    margin-right: 16px;
    text-align: center;
}

.lastest {
    font-weight: 500;
    font-size: 16px;
    line-height: 1;
    margin-top: 10px;
    color: #58667e;
    padding-bottom: 16px;
}

.title {
    font-weight: 600;
    font-size: 18px;
    line-height: 1.2;
    color: #1e1e1e;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
}


</style>
