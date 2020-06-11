class AddCurrentUserIdsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :current_user_ids, :text
  end
end
