# Created 07/22/24 by Jamaal Wairegi: Adds not-null constraint to username

class AddConstraintToUsername < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :username, false
  end
end
