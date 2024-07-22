# Created 07/22/24 by Jamaal Wairegi: IncorrectChoices now has association with Questions table instead of Quiz

class AddQuestionIdToIncorrectChoice < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :incorrect_choices, column: :quiz_id
    remove_column :incorrect_choices, :quiz_id
    add_column :incorrect_choices, :question_id, :integer
    add_foreign_key :incorrect_choices, :questions, column: :question_id
  end
end
