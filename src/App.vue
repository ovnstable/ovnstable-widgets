<template>
    <div id="app">
        <template v-if="type==='polybor'">
            <Polybor/>
        </template>
        <template v-else>
            Unknown widget type: {{type}}
        </template>
    </div>
</template>

<script>

import Polybor from "@/components/Polybor";

export default {
    name: 'App',
    props: {
        type: {
            type: String,
            default: 'polybor'
        },
    },
    components: {
        Polybor,
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
