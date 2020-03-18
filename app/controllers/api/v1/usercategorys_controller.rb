module Api
    module V1
      class UsercategorysController  < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :set_user
        before_action :authenticate
  
        def index
          render json: { status: 'SUCCESS', message: 'Loaded category', data: @user.categorys.all }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the category', data: @usercategory }
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

        def set_user_usercategory
            @usercategory = @user.categorys.find_by!(id: params[:id]) if @user
        end
      end
    end
  end

