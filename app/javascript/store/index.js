import Vue from 'vue'
import Vuex from 'vuex'

import Room from './modules/rooms'
import Station from './modules/stations'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    Room,
    Station
  }
})
