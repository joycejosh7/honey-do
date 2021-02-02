class AddRoomIdToChores < ActiveRecord::Migration[6.1]
  def change
    add_reference :chores, :room, null: false, foreign_key: true
  end
end
