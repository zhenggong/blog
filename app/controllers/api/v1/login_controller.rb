class LoginController < ApplicationController
  def login
    # ↓ここから
    login_user = User.find_by(name:params[:name],password:params[:password])
    if login_user != nil
      render plain: login_user.token
    else
      render plain: 'no auth'
    end
    # ↑ここまで追記しました
  end
end