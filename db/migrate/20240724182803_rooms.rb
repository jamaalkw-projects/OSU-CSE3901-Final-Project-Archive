class Rooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_number

      t.timestamps
    end
  end
end
