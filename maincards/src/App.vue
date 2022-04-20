<template>
    <div id="app-doughnut">
        <MainCards/>
    </div>
</template>

<script>


import MainCards from "./components/MainCards";
export default {
    name: 'App',
    props: {
        width: {
            type: String,
        }
    },
    components: {
        MainCards,
    }
}
</script>

<style>

#app-doughnut {
    font-family: Lato, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    background-color: transparent;

    width: 100%;
}

.main-card-container {
    height: 186px !important;
}

</style>
