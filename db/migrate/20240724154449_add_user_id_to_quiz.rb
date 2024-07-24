class AddUserIdToQuiz < ActiveRecord::Migration[7.1]
  def change
    add_column :quizzes, :user_id, :integer
    add_index :quizzes, :user_id
    add_foreign_key :quizzes, :users
  end
end
