class Room < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  serialize :current_user_ids, Array
end
