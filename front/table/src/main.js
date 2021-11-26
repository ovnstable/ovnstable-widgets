import Vue from 'vue'
import App from './App.vue'
import 'document-register-element/build/document-register-element'

Vue.config.productionTip = false

import vueCustomElement from 'vue-custom-element'
Vue.use(vueCustomElement)

Vue.customElement('ovn-widget-table', App)
