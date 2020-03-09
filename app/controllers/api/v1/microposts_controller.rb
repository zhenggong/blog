module Api
    module V1
      class MicropostsController  < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :set_micropost, only: [:show, :update, :destroy]
        before_action :authenticate
  
        def index
          microposts = Micropost.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'Loaded microposts', data: microposts }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the micropost', data: @micropost }
        end
  
        def create
          micropost = Micropost.new(micropost_params)
          if micropost.save
            render json: { status: 'SUCCESS', data: micropost }
          else
            render json: { status: 'ERROR', data: micropost.errors }
          end
        end
  
        def destroy
          @micropost.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the micropost', data: @micropost }
        end
  
        def update
          if @micropost.update(micropost_params)
            render json: { status: 'SUCCESS', message: 'Updated the micropost', data: @micropost }
          else
            render json: { status: 'SUCCESS', message: 'Not updated', data: @micropost.errors }
          end
        end
  
        private
  
        def set_micropost
          @micropost = Micropost.find(params[:id])
        end
  
        def micropost_params
          params.require(:micropost).permit(:content, :user_id)
        end

        def authenticate
          authenticate_or_request_with_http_token do |token,options|
            auth_user = User.find_by(token: token)
            auth_user != nil ? true : false
          end
    end
      end
    end
  end
