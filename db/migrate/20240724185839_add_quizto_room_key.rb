class AddQuiztoRoomKey < ActiveRecord::Migration[7.1]
  def change
    remove_column :rooms, :quiz_id, :string
    add_reference :rooms, :quiz, foreign_key: true
  end
end
