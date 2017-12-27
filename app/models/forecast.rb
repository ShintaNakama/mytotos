class Forecast < ApplicationRecord
    belongs_to :user
    #has_one :game, foreign_key: :id
    belongs_to :game
    #belongs_to :forecast_point
    # has_many :forecast_point
end
