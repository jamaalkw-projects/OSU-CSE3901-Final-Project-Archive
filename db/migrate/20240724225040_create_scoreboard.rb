class CreateScoreboard < ActiveRecord::Migration[7.1]
  def change
    create_table :scoreboards do |t|
      t.references :quizzes, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :answered_correct
      t.integer :answered

      t.timestamps
    end
  end
end
