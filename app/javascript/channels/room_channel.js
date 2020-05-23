import consumer from "./consumer"
import store from 'store'

import { EventEmitter } from 'events';

export function connect(id) {
  const events = new EventEmitter();

  return consumer.subscriptions.create(
    { channel: "RoomChannel", id: id },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        events.removeAllListeners()
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        if (data.command) {
          store.dispatch(
            data.command,
            data.params || {}
          )
        }

        if (data.move) {
          events.emit('move', data.move, data.name)
        }
      },
      on(event, callback) {
        events.on(event, callback)
      }
    }
  );
}
