Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :microposts
      resources :categorys
      post 'login/login'
    end
  end
end