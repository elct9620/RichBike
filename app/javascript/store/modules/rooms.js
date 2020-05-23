const PREFIX = 'ROOM.'

const types = {
  LOAD: `${PREFIX}LOAD`,
}

const state = () => {
  return {
    items: [],
  }
}

const mutations = {
  [types.LOAD] (state, rooms) {
    state.items= [...rooms]
  },
}

const actions = {
  async loadRooms({ commit, state }) {
    const rooms = await fetch(`/api/rooms.json`).then(res => res.json())
    commit(types.LOAD, rooms)
  }
}

const getters = {
  getRooms (state) {
    return state.items
  },
}

export default {
  state,
  mutations,
  actions,
  getters
}
