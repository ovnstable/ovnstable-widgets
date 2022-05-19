<template>
    <div id="app-portfoliocards">
        <PortfolioCards/>
    </div>
</template>

<script>


import PortfolioCards from "./components/PortfolioCards";
export default {
    name: 'App',
    props: {
        width: {
            type: String,
        }
    },
    components: {
        PortfolioCards,
    }
}
</script>

<style>

#app-portfoliocards {
    font-family: Lato, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;

    width: 100%;
}

</style>
