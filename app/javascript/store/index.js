import Vue from 'vue'
import Vuex from 'vuex'

import Room from './modules/rooms'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    Room
  }
})
