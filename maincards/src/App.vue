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
}

/* Extra small devices (phones, 600px and down) */
@media only screen and (max-width: 580px) {

    #app-doughnut {
        width: 100%;
    }

    .main-card-container {
        height: 186px !important;
    }
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 580px) {

    #app-doughnut {
        width: 100%;
    }

    .main-card-container {
        height: 186px !important;
    }
}

</style>
