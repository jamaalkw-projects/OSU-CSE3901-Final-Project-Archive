class RemoveAnswersFromQuestion < ActiveRecord::Migration[7.1]
  def change
    remove_column :quizzes, :wrong_answer_1, :string
    remove_column :quizzes, :wrong_answer_2, :string
    remove_column :quizzes, :wrong_answer_3, :string
    remove_column :quizzes, :correct_answer, :string
  end
end
