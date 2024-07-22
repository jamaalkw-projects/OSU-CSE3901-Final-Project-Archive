# Created 07/22/24 by Jamaal Wairegi: Makes quiz_id foreign key in IncorrectChoices table.

class AddQuizIdToIncorrectChoice < ActiveRecord::Migration[7.1]
  def change
    add_column :incorrect_choices, :quiz_id, :integer
    add_foreign_key :incorrect_choices, :quizzes, column: :quiz_id
  end
end
