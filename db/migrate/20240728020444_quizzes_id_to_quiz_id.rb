class QuizzesIdToQuizId < ActiveRecord::Migration[7.1]
  def change
    rename_column :scoreboards, :quizzes_id, :quiz_id
  end
end
