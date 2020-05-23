<template>
  <div class="row">
    <div class="col-md-3" v-for="(room, idx) in items" :key="idx">
      <Room :name="room.name" />
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

import Room from './_Room'
import LobbyChannel from 'channels/lobby_channel'

export default {
  name: 'Lobby',
  components: {
    Room
  },
  data () {
    return {
    }
  },
  created() {
    this.loadRooms()
  },
  computed: {
    ...mapGetters({
      items: 'getRooms',
    })
  },
  methods: {
    ...mapActions([
      'loadRooms',
    ]),
  },
  watch: {
  }
}
</script>
