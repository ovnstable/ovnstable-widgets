<template>
    <div id="app-apyrate">
        <ApyRate/>
    </div>
</template>

<script>


import ApyRate from "./components/ApyRate";
export default {
    name: 'App',
    props: {
        width: {
            type: String,
        }
    },
    components: {
        ApyRate,
    }
}
</script>

<style>

/* mobile */
@media only screen and (max-width: 1400px) {
}

@media only screen and (min-width: 1400px) {
}

#app-apyrate {
    font-family: Lato, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;

    width: 100%;
}

</style>
