import Vue from 'vue'
import App from './App.vue'
import 'document-register-element/build/document-register-element'
import Vuex from 'vuex'
import utils from "./plugins/utils";

Vue.config.productionTip = false

import vueCustomElement from 'vue-custom-element'
import vuetify from './plugins/vuetify'
Vue.use(vueCustomElement)
Vue.use(Vuex)

Vue.prototype.$utils = utils;

Vue.customElement('ovn-apyrate', App)

new Vue({
    vuetify,
    render: h => h(App)
});
