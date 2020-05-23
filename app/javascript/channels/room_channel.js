import consumer from "./consumer"

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
        // Called when there's incoming data on the websocket for this channel
      }
    }
  );
}
