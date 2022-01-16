import Vue from 'vue'
import App from './App.vue'
import 'document-register-element/build/document-register-element'
import Vuex from 'vuex'

Vue.config.productionTip = false

import vueCustomElement from 'vue-custom-element'
import vuetify from './plugins/vuetify'
Vue.use(vueCustomElement)
Vue.use(Vuex)

Vue.customElement('ovn-widget-rate', App)

new Vue({
    vuetify,
    render: h => h(App)
}).$mount('#app');