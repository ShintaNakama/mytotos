class CreateForecastPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :forecast_points do |t|
      t.integer :point
      t.integer :forecast_id

      t.timestamps
    end
  end
end
