<template>
    <div id="app-distrate">
        <DistRate/>
    </div>
</template>

<script>


import DistRate from "./components/DistRate";
export default {
    name: 'App',
    props: {
        width: {
            type: String,
        }
    },
    components: {
        DistRate,
    }
}
</script>

<style>

/* mobile */
@media only screen and (max-width: 1400px) {
}

@media only screen and (min-width: 1400px) {
}

@media only screen and (max-width: 960px) {
    #app-distrate {
        width: 80vw !important;
    }
}

@media only screen and (min-width: 961px) {
    #app-distrate {
        width: 40vw !important;
    }
}

#app-distrate {
    font-family: Lato, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;
}

</style>
