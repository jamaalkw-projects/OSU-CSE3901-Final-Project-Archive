class AddIndesToQuestionId < ActiveRecord::Migration[7.1]
  def change
    add_index :incorrect_choices, :question_id
    add_foreign_key :incorrect_choices, :questions
  end
end
