import Vue from 'vue'
import Vuex from 'vuex'

import Room from './modules/room'
import Rooms from './modules/rooms'
import Stations from './modules/stations'
import Event from './modules/event'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    Room,
    Rooms,
    Stations,
    Event
  }
})
