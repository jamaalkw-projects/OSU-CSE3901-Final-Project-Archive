class AddDefaultValueToScore < ActiveRecord::Migration[7.1]
  def change
    change_column_default :scoreboards, :answered, 0
    change_column_default :scoreboards, :answered_correct, 0
  end
end
