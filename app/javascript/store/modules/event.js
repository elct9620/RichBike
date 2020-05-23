const PREFIX = 'EVENTM.'

const types = {
  LOAD: `${PREFIX}LOAD`,
}

const state = () => {
  return {
    items: [],
  }
}

const mutations = {
  [types.LOAD] (state, events) {
    state.items = [...events]
  },
}

const actions = {
  async loadRoomEvents({ commit, state }, roomId) {
    const events = await fetch(`/api/rooms/${roomId}/events.json`).then(res => res.json())
    commit(types.LOAD, events)
  }
}

const getters = {
  getRoomEvents (state) {
    return state.items
  },
}

export default {
  state,
  mutations,
  actions,
  getters
}
