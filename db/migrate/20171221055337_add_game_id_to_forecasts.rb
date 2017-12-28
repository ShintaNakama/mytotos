class AddGameIdToForecasts < ActiveRecord::Migration[5.1]
  def change
    add_column :forecasts, :game_id, :integer
  end
end
