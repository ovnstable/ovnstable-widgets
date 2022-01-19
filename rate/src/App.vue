<template>
    <div id="app">
        <template v-if="type==='interest'">
            <InterestRate/>
        </template>
        <template v-else-if="type === 'distribution'">
            <DistributionRate/>
        </template>
        <template v-else>
            Unknown widget type: {{type}}
        </template>
    </div>
</template>

<script>

import InterestRate from "./components/InterestRate";
import DistributionRate from "./components/DistributionRate";

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
        DistributionRate,
        InterestRate,
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
@media only screen and (max-width: 600px) {

    #app {
        width: 100%
    }
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {

    #app {
        width: 600px;
    }
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {

    #app {
        width: 768px;
    }
}

/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) {
    #app {
        width: 992px;
    }
}

/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) {
    #app {
        width: 1200px;
    }
}
</style>
