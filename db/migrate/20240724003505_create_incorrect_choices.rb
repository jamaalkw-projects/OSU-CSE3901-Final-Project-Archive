class CreateIncorrectChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :incorrect_choices do |t|
      t.string :option
      t.integer :question_id

      t.timestamps
    end
  end
end
