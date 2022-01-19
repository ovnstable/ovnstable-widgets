<template>
    <div id="app">
        <template v-if="type==='doughnut'">
            <DoughnutChart/>
        </template>
        <template v-else>
            Unknown widget type: {{type}}
        </template>
    </div>
</template>

<script>


import DoughnutChart from "@/components/DoughnutChart";
export default {
    name: 'App',
    props: {
        type: {
            type: String,
            default: 'interest'
        },

        width: {
            type: String,
        }
    },
    components: {
        DoughnutChart
    }
}
</script>

<style>

#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;
}

/* Extra small devices (phones, 600px and down) */
@media only screen and (max-width: 560px) {

    #app {
        width: 100%;
    }

    .doughnut {
        overflow-x: auto !important;
        overflow-y: hidden !important;
    }

    .doughnut-row {
        width: 580px;
    }
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 560px) {

    #app {
        width: 560px;
    }
}

</style>
