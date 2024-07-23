class CreateCorrectChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :correct_choices do |t|
      t.string :option
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
