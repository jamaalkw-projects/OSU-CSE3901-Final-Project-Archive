# Created 07/18/2024 by Jamaal Wairegi: Makes IncorrectChoices table.

class CreateIncorrectChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :incorrect_choices do |t|
      t.string :answer

      t.timestamps
    end
  end
end
