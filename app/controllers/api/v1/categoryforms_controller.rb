module Api
    module V1
      class CategoryformsController  < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :set_micropost, only: [:show, :update, :destroy]
        before_action :authenticate
        #get url/categoryforms
        def index
          categoryforms = Categoryform.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'Loaded microposts', data: categoryforms }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the micropost', data: @categoryform }
        end
        #post url/categoryforms
        def create
          categoryform = Categoryform.new(categoryform_params)
          if categoryform.save
            render json: { status: 'SUCCESS', data: categoryform }
          else
            render json: { status: 'ERROR', data: categoryform.errors }
          end
        end
  
        def destroy
          @categoryform.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the micropost', data: @categoryform }
        end
        #get url/categoryforms
        def update
          if @categoryform.update(categoryform_params)
            render json: { status: 'SUCCESS', message: 'Updated the micropost', data: @categoryform }
          else
            render json: { status: 'SUCCESS', message: 'Not updated', data: @categoryform.errors }
          end
        end
  
        private
        #get url/categoryforms/id
        def set_categoryform
          @categoryform = Categoryform.find(params[:id])
        end
        #post url/categoryforms
        #TODO
        def categoryform_params
          params.require(:categoryform).permit!
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
