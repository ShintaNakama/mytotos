class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.integer :user_id
      t.string :forecast_result
      t.integer :forecast_home_goals
      t.integer :forecast_away_goals

      t.timestamps
    end
  end
end
