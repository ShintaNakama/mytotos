class ForecastsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @game = Game.find_by(id: params[:id])
    end
    
    def input
        if params[:goals_home_team] > params[:goals_away_team]
            @forecast_result = "win"
        elsif params[:goals_home_team] < params[:goals_away_team]
            @forecast_result = "lose"
        else
            @forecast_result = "draw"
        end

        @forecast = Forecast.new(user_id: current_user.id, 
                                game_id: params[:game_id],
                                forecast_result: @forecast_result,
                                forecast_home_goals: params[:goals_home_team], 
                                forecast_away_goals: params[:goals_away_team])
        
        if @forecast.save
            @forecast_point = ForecastPoint.new(user_id: current_user.id, forecast_point: params[:bet_point], forecast_id: @forecast.id)
            @forecast_point.save!
            bet_point = params[:bet_point].to_i
            @bet_point = bet_point * -1
            @bet_point_data = Point.new(user_id: current_user.id, point: @bet_point, forecast_id: @forecast.id)
            @bet_point_data.save!
            #@point_data = Point.new(user_id: current_user.id, forecast_point_id: @forecast_point.id)
            #@point_data.save!
            redirect_to("/pages/show")
        else
            render 'show'  
        end
    end

    def compare    
        @forecast_data = Forecast.where(user_id: current_user.id).order(:game_id)
        @current_point_data = Point.where(user_id: current_user.id).group(:forecast_id).count
        
    end
end
