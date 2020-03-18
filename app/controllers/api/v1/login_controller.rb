module Api
  module V1
class LoginController < ApplicationController
  def login
    # ↓ここから
    login_user = User.find_by(name:params[:name])
    if login_user.authenticate(params[:password])
      authinfo = {name: params[:name], token: login_user.token, expire:1234444567, user_id:login_user.id}
      render json: { status: 'SUCCESS', message: 'Loaded the micropost', data: authinfo }
    else
      render plain: 'no auth'
    end
    # ↑ここまで追記しました
  end
end
end
end