class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :date
      t.string :status
      t.integer :matchday
      t.string :home_team_name
      t.string :away_team_name
      t.integer :goals_home_team
      t.integer :goals_away_team

      t.timestamps
    end
  end
end
