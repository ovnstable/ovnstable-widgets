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
            <table style="margin-top: 10px">
                <thead>
                <tr class="table-header">
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col" class="table-sub-header" colspan="2">52-Week</th>
                </tr>
                <tr class="table-header table-tr">
                    <th scope="col"></th>
                    <th scope="col">Latest</th>
                    <th scope="col">Week ago</th>
                    <th scope="col">High</th>
                    <th scope="col">Low</th>
                </tr>
                </thead>
                <tbody>
                <tr class="table-tr" v-bind:key="item.id" v-for="item in items">
                    <td data-label="" >{{ item.label }}</td>
                    <td data-label="Latest">{{ item.latest }}%</td>
                    <td data-label="Week ago">{{ item.weekAgo }}%</td>
                    <td data-label="High">{{ item.high }}%</td>
                    <td data-label="Low">{{ item.low }}%</td>
                </tr>
                </tbody>
            </table>
        </template>
        <template v-else>
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


    computed: {},

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
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}


.table-ovn {
    margin-top: 15px;
    width: 100%;
    border-radius: 5px;
    padding: 15px;
    border-collapse: collapse;
    overflow: auto;
    display: block;
    overflow-x: auto;
    white-space: nowrap;
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


@media screen and (max-width: 767px) {
    table tr > * {
        display: block;
    }

    table tr {
        display: table-cell;
    }
}


.main {
    width: 100%;
    max-width: 700px;
    font-style: normal;
    padding: 16px;
    background: #fff;
    border-radius: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;
    text-align: center;
}

.link {
    font-size: 16px;
}

.sub-title {
    font-size: 14px;
    margin-top: 5px;
    margin-bottom: 0;
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


.table_wrapper {
    display: block;
    overflow-x: auto;
    white-space: nowrap;
}


table {
    border: 1px solid #ccc;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    width: 100%;
    table-layout: fixed;
}


table tr {
    border: 1px solid #ddd;
    padding: .35em;
}

table th,
table td {
    padding: .625em;
    text-align: center;
}

table th {
    font-size: .85em;
    letter-spacing: .1em;
    text-transform: uppercase;
}

@media screen and (max-width: 600px) {
    table {
        border: 0;
    }

    table caption {
        font-size: 1.3em;
    }

    table thead {
        border: none;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }

    table tr {
        border-bottom: 3px solid #ddd;
        display: block;
        margin-bottom: .625em;
    }

    table td {
        border-bottom: 1px solid #ddd;
        display: block;
        font-size: .8em;
        text-align: right;
    }

    table td::before {
        /*
        * aria-label has no advantage, it won't be read inside a table
        content: attr(aria-label);
        */
        content: attr(data-label);
        float: left;
        font-weight: bold;
        text-transform: uppercase;
    }

    table td:last-child {
        border-bottom: 0;
    }
}


</style>
