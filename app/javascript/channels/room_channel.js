import CableReady from "cable_ready";
import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
  const room_element = document.getElementById("room-id");
  const room_id = room_element.getAttribute("data-room-id");

  // window.subscriptions = consumer.subscriptions
  // console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    if (JSON.parse(subscription.identifier).channel == "RoomChannel")
      consumer.subscriptions.remove(subscription);
  });

  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: room_id },
    {
      connected() {
        console.log("connected to room channel " + room_id);
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        CableReady.perform(data.operations);
      },
    }
  );
});
