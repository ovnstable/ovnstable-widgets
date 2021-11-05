<template>
    <div class="main">
        <div>
            <img alt="Ovn logo" src="../assets/ovn.png">
        </div>
        <div class="title" @click="clickLogo">
            <a class="link">Polybor Overnight</a>
        </div>

        <template v-if="item">
            <div class="lastest">
                {{ item.latest }}%
            </div>
            <div class="changes" v-bind:class="{ up: dayUp}">
                {{ dayUp ? '+' : '' }}
                <span>{{ item.day }}% 1D</span>
            </div>
            <div class="changes" style="margin-top: 5px" v-bind:class="{ up: weekUp}">
                {{ weekUp ? '+' : '' }}
                <span>{{ item.week }}% 7D</span>
            </div>
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
    name: 'Polybor',
    props: {
        msg: String
    },


    computed: {

        weekUp: function () {
            return this.item.week > 0;
        },
        dayUp: function () {
            return this.item.day > 0;
        }
    },

    data: () => ({
        loading: true,
        item: null,
    }),


    created() {
        this.getData();
    },

    methods: {

        getData() {

            fetch('https://app.ovnstable.io/api/widget/polybor')
            // fetch('http://localhost:3000/api/widget/polybor')
                .then(value => value.json())
                .then(value => {
                    this.item = value;
                    this.loading = false;
                }).catch(reason => {
                console.log('Error get data: ' + reason)
                this.loading = false;
            })
        },

        clickLogo() {
            window.open('https://app.ovnstable.io/fund', '_blank').focus();
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
    width: 141px;
    padding: 16px;
    background: #fff;
    border-radius: 16px;
    box-shadow: #e1e5ea 0px 1px 6px 0px;
    box-sizing: border-box;
    display: inline-block;
    margin-right: 16px;
    text-align: center;
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
    color: #000;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
}



</style>
