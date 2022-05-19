<template>
    <div id="app-tvlrate">
        <TvlRate/>
    </div>
</template>

<script>


import TvlRate from "./components/TvlRate";
export default {
    name: 'App',
    props: {
        width: {
            type: String,
        }
    },
    components: {
        TvlRate,
    }
}
</script>

<style>

#app-tvlrate {
    font-family: Lato, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;

    width: 100%;
}

.main-card-container {
    height: 226px !important;
}

</style>
