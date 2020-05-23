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

import { connect } from 'channels/room_channel'

import Map from './_Map'
import PlayerList from './_PlayerList'

export default {
  data() {
    return {
      channel: null,
    }
  },
  components: {
    Map,
    PlayerList
  },
  created() {
    this.loadStations()
    this.loadRoomPlayers(this.$route.params.id)

    this.channel = connect(this.$route.params.id)
  },
  beforeRouteLeave() {
    this.channel.unsubscribe()
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
