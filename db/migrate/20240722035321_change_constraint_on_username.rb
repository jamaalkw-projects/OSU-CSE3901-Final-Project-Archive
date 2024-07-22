# Created 07/22/24 by Jamaal Wairegi: Removes unique constraint on username.

class ChangeConstraintOnUsername < ActiveRecord::Migration[7.1]
  def change
    remove_index :users, :username
    add_index :users, :username, :unique => false
  end
end
