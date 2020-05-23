import consumer from "./consumer"
import store from 'store'

export function connect(id) {
  return consumer.subscriptions.create(
    { channel: "RoomChannel", id: id },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        if (data.command) {
          store.dispatch(
            data.command,
            data.params || {}
          )
        }
      }
    }
  );
}
