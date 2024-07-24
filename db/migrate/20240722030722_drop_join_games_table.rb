# Created 07/21/24 by Jamaal Wairegi: Removes 'join_games' table, created by accident

class DropJoinGamesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :join_games
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
