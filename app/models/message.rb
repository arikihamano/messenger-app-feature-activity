class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def sent_by_(sender)
    sender.id == user_id
  end
end
