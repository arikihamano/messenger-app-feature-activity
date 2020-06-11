class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    room.current_user_ids << current_user.id
    room.save
    stream_from "room_#{params[:room_id]}_user_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
