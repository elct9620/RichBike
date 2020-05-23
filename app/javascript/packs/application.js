// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import '@coreui/coreui/scss/coreui.scss';

require("@rails/ujs").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require.context('@coreui/icons/sprites', true, /\.svg$/);

import Vue from 'vue'
import App from 'app'
import CoreuiVue from '@coreui/vue'

Vue.use(CoreuiVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  })
  const $app = document.getElementById('app')

  if ($app) {
    app.$mount($app)
  }
})
