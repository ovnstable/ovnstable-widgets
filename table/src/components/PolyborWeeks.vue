<template>
    <div class="main">
        <div>
            <img alt="Ovn logo" src="../assets/ovn.png">
        </div>
        <div class="title" @click="clickLogo">
            <a class="link">Polybor Overnight</a>
            <p class="sub-title">Interest rate table</p>
        </div>

        <template v-if="!loading">
            <table class="table-ovn">
                <tr class="table-header">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th class="table-sub-header" colspan="2">52-Week</th>
                </tr>
                <tr class="table-header table-tr">
                    <th></th>
                    <th>Latest</th>
                    <th>Week ago</th>
                    <th>High</th>
                    <th>Low</th>
                </tr>
                <tr class="table-tr"  v-bind:key="item.id" v-for="item in items">
                    <td style="text-align: start">{{item.label}}</td>
                    <td>{{item.latest}}%</td>
                    <td>{{item.weekAgo}}%</td>
                    <td>{{item.high}}%</td>
                    <td>{{item.low}}%</td>
                </tr>
            </table>
        </template>
        <template v-else >
            <div class="loader"></div>
        </template>

        <div class="signature" @click="clickLogo">
            <div class="powered-by">Powered by</div>
            <div class="powered">ovnstable.io</div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PolyborWeeks',
    props: {
        msg: String
    },


    computed: {


    },

    data: () => ({
        loading: true,
        items: null,
    }),


    created() {
        this.getData();
    },

    methods: {

        getData() {
            this.loading = true;
            fetch(process.env.VUE_APP_WIDGET_API_URL + '/widget/polybor-weeks')
                .then(value => value.json())
                .then(value => {
                    this.items = value;
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        clickLogo() {
            window.open(process.env.VUE_APP_GO_TO_URL, '_blank').focus();
        },
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.signature {
    margin-top: 10px;
    cursor: pointer;
}

.powered {
    font-weight: 500;
    font-size: 11px;
    color: #111111;
    margin-right: 5px;
}

.powered-by {
    font-weight: 500;
    font-size: 11px;
    color: #808a9d;
    margin-right: 5px;
}

.loader {
    margin-left: auto;
    margin-right: auto;
    margin-top: 5px;
    border: 5px solid #f3f3f3; /* Light grey */
    border-top: 5px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 20px;
    height: 20px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.up {
    background-color: #16c784 !important;
}

.table-ovn {
    margin-top: 15px;
    width: 100%;
    border-radius: 5px;
    padding: 15px;
    border-collapse: collapse;

}


.table-sub-header {
    border-bottom: 1pt solid #c7c7c7;
    color: #1e1e1e;
    font-weight: bold;
}

.table-header {
    color: #9d9d9d;
}

.table-tr {
    border-bottom: 1pt solid #c7c7c7;
}

.table-ovn td {
    padding: 15px;
}

a:link {
    color: #131313;
    text-decoration: none;
}

a:visited {
    color: #131313;
    text-decoration: none;
}

.changes {
    height: 21px;
    display: inline-block;
    align-items: center;
    font-weight: 600;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    font-size: 12px;
    line-height: 21px;
    color: #fff;
    border-radius: 8px;
    padding: 0px 6px;
    background-color: #ea3943;
}

.main {
    font-style: normal;
    width: 700px;
    padding: 16px;
    background: #fff;
    border-radius: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;

    text-align: center;
}

.link{
    font-size: 16px;
}

.sub-title{
    font-size: 14px;
    margin-top: 5px;
    margin-bottom: 0;
}

.lastest {
    font-weight: 500;
    font-size: 16px;
    line-height: 1;
    margin-top: 10px;
    color: #58667e;
    padding-bottom: 16px;
}

.title {
    font-weight: 600;
    font-size: 16px;
    line-height: 1.2;
    color: #1e1e1e;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
}



</style>
