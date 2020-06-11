class SendMessageJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(message)

    html = ApplicationController.render(
      partial: 'messages/theirs',
      locals: { message: message }
    )

    room = message.room
    room.current_users.each do |user|
      unless message.sent_by?(user)
        stream = "room_#{message.room_id}_user_#{user.id}"
        cable_ready[stream].insert_adjacent_html(
          selector: '#messages',
          html: html
        )
        cable_ready.broadcast
      end
    end
  end
end
