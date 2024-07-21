class CreateJoinGames < ActiveRecord::Migration[7.1]
  def change
    create_table :join_games do |t|

      t.timestamps
    end
  end
end
