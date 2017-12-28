class AddGameResultToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_result, :string
  end
end
