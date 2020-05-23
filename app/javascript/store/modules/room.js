const PREFIX = 'ROOM.'

const types = {
  LOAD: `${PREFIX}LOAD_PLAYER`,
}

const state = () => {
  return {
    players: [],
  }
}

const mutations = {
  [types.LOAD] (state, players) {
    state.players = [...players]
  },
}

const actions = {
  async loadRoomPlayers({ commit, state }, roomId) {
    const players = await fetch(`/api/rooms/${roomId}/players.json`).then(res => res.json())
    commit(types.LOAD, players)
  }
}

const getters = {
  getRoomPlayers (state) {
    return state.players
  },
}

export default {
  state,
  mutations,
  actions,
  getters
}
