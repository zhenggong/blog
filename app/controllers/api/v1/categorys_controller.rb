module Api
    module V1
      class CategorysController < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :set_category, only: [:show, :update, :destroy]
        before_action :authenticate
  
        def index
          categorys = Category.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'Loaded categorys', data: categorys }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the category', data: @category }
        end
  
        def create
          category = Category.new(category_params)
          if category.save
            render json: { status: 'SUCCESS', data: category }
          else
            render json: { status: 'ERROR', data: category.errors }
          end
        end
  
        def destroy
          @category.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the category', data: @category }
        end
  
        def update
          if @category.update(category_params)
            render json: { status: 'SUCCESS', message: 'Updated the category', data: @category }
          else
            render json: { status: 'SUCCESS', message: 'Not updated', data: @category.errors }
          end
        end
  
        private
  
        def set_category
          @category = Category.find(params[:id])
        end
  
        def category_params
          params.require(:category).permit(:content, :user_id)
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
