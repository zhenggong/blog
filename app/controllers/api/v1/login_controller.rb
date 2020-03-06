module Api
  module V1
class LoginController < ApplicationController
  def login
    # ↓ここから
    login_user = User.find_by(name:params[:name])
    if login_user.authenticate(params[:password])
      render plain: login_user.token
    else
      render plain: 'no auth'
    end
    # ↑ここまで追記しました
  end
end
end
end