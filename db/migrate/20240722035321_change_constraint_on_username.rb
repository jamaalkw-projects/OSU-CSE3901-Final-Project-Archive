class ChangeConstraintOnUsername < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :username, :unique => false
  end
end
