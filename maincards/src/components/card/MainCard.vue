<template>
    <div class="main-card-container">
        <v-row>
            <v-spacer></v-spacer>
            <label class="value-label">
                {{ value }}
            </label>
            <v-spacer></v-spacer>
        </v-row>

        <v-row>
            <v-spacer></v-spacer>
            <label class="text-label">
                {{ label }}
            </label>
            <v-spacer></v-spacer>
        </v-row>
    </div>
</template>

<script>

export default {
    name: "MainCard",

    props: {
        label: {
            type: String,
            default: null,
        },

        value: {
            type: String,
            default: null,
        },
    },

    components: {},

    data: () => ({}),

    computed: {
    },

    mounted() {
    },

    created() {
    },

    methods: {
    }
}
</script>

<style>

.main-card-container {
    border-radius: 20px !important;
    background: #1D2029 !important;
}

.value-label {
    font-style: normal;
    font-weight: 700;
    font-size: 48px;
    line-height: 56px;

    background: linear-gradient(91.26deg, #A9CDFF 0%, #72F6D1 21.87%, #A0ED8D 55.73%, #FED365 81.77%, #FAA49E 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;

    margin-top: 40px !important;
}

.text-label {
    font-style: normal;
    font-weight: 600;
    font-size: 24px;
    line-height: 36px;

    color: #F3F3F3;

    margin-top: 14px !important;
}
</style>