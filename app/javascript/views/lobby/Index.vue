<template>
  <div>
    <div class="row">
      <CButton
        color="info"
        class="ml-auto"
        @click="create"
        >
        開新遊戲
      </CButton>
    </div>
    <div class="row">
      <div class="col-md-3" v-for="(room, idx) in items" :key="idx">
        <Room :name="room.name" />
      </div>
    </div>
    <CreateRoomForm :show.sync="formEnabled" />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

import Room from './_Room'
import CreateRoomForm from './_CreateRoomForm'
import LobbyChannel from 'channels/lobby_channel'

export default {
  name: 'Lobby',
  components: {
    Room,
    CreateRoomForm,
  },
  data () {
    return {
      formEnabled: false
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
    create() {
      this.formEnabled = true
    }
  },
  watch: {
  }
}
</script>
