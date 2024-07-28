class RenameUsersIdToUserIdInScoreboards < ActiveRecord::Migration[7.1]
  def change
    rename_column :scoreboards, :users_id, :user_id
  end
end
