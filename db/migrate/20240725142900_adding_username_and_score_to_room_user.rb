class AddingUsernameAndScoreToRoomUser < ActiveRecord::Migration[7.1]
  def change
    add_column :room_users, :username, :string
    add_column :room_users, :score, :integer
  end
end
