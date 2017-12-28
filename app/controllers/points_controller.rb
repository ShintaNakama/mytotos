class PointsController < ApplicationController
    before_action :authenticate_user!
    
    # 配当ポイントを反映させるアクション
    def dividend
        @currnet_point_data = Point.where(user_id: current_user.id, forecast_id: params[:forecast_id])
        # 予想結果によって配当ポイントを変動させるためのメソッド
        case params[:dividend]
        # scoreを当てた場合
        when "hit_score"
            # 予想データを取得
            @forecast_point_data = ForecastPoint.find_by(user_id: current_user.id, forecast_id: params[:forecast_id])
            # 掛けたポイントを５倍にする
            @result_point = @forecast_point_data.forecast_point * 5
            # @point = Point.find_by(forecast_point_id: params[:forecast_id])
            # if @point == nil
            #     @point = 0
            # end
            # @real_point = @point + @result_point
            # 5倍にしたポイントをpointテーブルに登録
            Point.create(user_id: current_user.id, point: @result_point, forecast_id: params[:forecast_id])
            redirect_to("/")
        when "hit_result"
            # 予想データを取得
            @forecast_point_data = ForecastPoint.find_by(user_id: current_user.id, forecast_id: params[:forecast_id])
            # 掛けたポイントを３倍にする
            @result_point = @forecast_point_data.forecast_point * 3
            # @point = Point.find_by(forecast_point_id: params[:forecast_id])
            # if @point == nil
            #     @point = 0
            # end
            # @real_point = @point + @result_point
            # 3倍にしたポイントをpointテーブルに登録
            Point.create(user_id: current_user.id, point: @result_point, forecast_id: params[:forecast_id])
            redirect_to("/")
        when "bad"
            @forecast_point_data = ForecastPoint.find_by(user_id: current_user.id, forecast_id: params[:forecast_id])
            
            @result_point = 0 
            # @point = Point.find_by(forecast_point_id: params[:forecast_id])
            # if @point == nil
            #      @point = 0
            # end
            # @real_point = @point - @result_point
            Point.create(user_id: current_user.id, point: @result_point, forecast_id: params[:forecast_id])
            redirect_to("/")
        end
    end
end
