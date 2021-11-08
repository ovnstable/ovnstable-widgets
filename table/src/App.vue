<template>
    <div id="app">
        <template v-if="type==='polybor-weeks'">
            <PolyborWeeks/>
        </template>
        <template v-else>
            Unknown widget type: {{type}}
        </template>
    </div>
</template>

<script>

import PolyborWeeks from "@/components/PolyborWeeks";

export default {
    name: 'App',
    props: {
        type: {
            type: String,
            default: 'polybor-weeks'
        },
    },
    components: {
        PolyborWeeks
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
