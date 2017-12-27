class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :current_point
  
    protected
  
    def configure_permitted_parameters
      added_attrs = [ :username, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
    # ヘッダーに現在のポイントを表示させる共通メソッド

    private
    def current_point
        # ログインユーザの最後のpointテーブルの値を取得

        return false if current_user.nil?
        @current_point = Point.where(user_id: current_user.id).last
        # pointがnilであれば、0にする。それ以外はそのユーザのすべてのpointを加算し現在のポイントを求める。
        if @current_point == nil
          @current_point = 0
          @current_user_point = @current_point
        else
          @current_point = Point.where(user_id: current_user.id)
          @current_user_point = @current_point.sum(:point)
        end
    
    end
end
