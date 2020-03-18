module Api
    module V1
      class UsermicropostsController  < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :set_user
        before_action :authenticate
  
        def index
          render json: { status: 'SUCCESS', message: 'Loaded microposts', data: @user.microposts.all }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the micropost', data: @usermicropost }
        end
  
        private

        def authenticate
          authenticate_or_request_with_http_token do |token,options|
            auth_user = User.find_by(token: token)
            auth_user != nil ? true : false
          end
        end

        def set_user
            @user = User.find(params[:user_id])
        end

        def set_user_usermicropost
            @usermicropost = @user.microposts.find_by!(id: params[:id]) if @user
        end
      end
    end
  end
