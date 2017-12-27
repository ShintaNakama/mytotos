class ForecastPoint < ApplicationRecord
    belongs_to :point, optional: true
    # belongs_to :forecast
end
