<template>
  <div>
    <div class="row">
      <div class="col-md-8">
        <Map />
      </div>
      <div class="col-md-4">
        <PlayerList :players="players" />
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

import Map from './_Map'
import PlayerList from './_PlayerList'

export default {
  data() {
    return {
    }
  },
  components: {
    Map,
    PlayerList
  },
  created() {
    this.loadStations()
    this.loadRoomPlayers(this.$route.params.id)
  },
  computed: {
    ...mapGetters({
      stations: 'getStations',
      players: 'getRoomPlayers',
    })
  },
  methods: {
    ...mapActions([
      'loadStations',
      'loadRoomPlayers',
    ]),
  }
}
</script>
