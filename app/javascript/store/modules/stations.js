const PREFIX = 'STATION.'

const types = {
  LOAD: `${PREFIX}LOAD`,
}

const state = () => {
  return {
    items: [],
  }
}

const mutations = {
  [types.LOAD] (state, stations) {
    state.items= [...stations]
  },
}

const actions = {
  async loadStations({ commit, state }) {
    const stations = await fetch(`/api/stations.json`).then(res => res.json())
    commit(types.LOAD, stations)
  }
}

const getters = {
  getStations (state) {
    return state.items
  },
}

export default {
  state,
  mutations,
  actions,
  getters
}
