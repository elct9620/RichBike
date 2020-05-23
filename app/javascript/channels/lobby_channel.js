import consumer from "./consumer"
import store from 'store'

consumer.subscriptions.create("LobbyChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.command) {
      switch(data.command) {
        case 'reload':
          store.dispatch('loadRooms')
          break;
      }
    }
    // Called when there's incoming data on the websocket for this channel
  }
});
