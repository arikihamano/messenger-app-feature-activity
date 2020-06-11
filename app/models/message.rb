class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def sent_by?(sender)
    sender.id == user_id
  end
end
