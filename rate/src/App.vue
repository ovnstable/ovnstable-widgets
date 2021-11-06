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
}
</style>
