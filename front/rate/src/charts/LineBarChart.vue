<script>

import { Line } from 'vue-chartjs'
import { Bar } from 'vue-chartjs'

export default {
    mixins: [Bar, Line],
    props: {
        chartdata: {
            type: Object,
            default: null
        },
        options: {
            type: Object,
            default: null
        }
    },
    mounted () {
        this.renderChart(this.chartdata, this.options)
    }
}

</script>

<style>
</style>
