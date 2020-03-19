Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        resources :usermicroposts
        resources :usercategorys
      end
      resources :microposts 
      resources :categorys
      resources :categoryforms
      post 'login/login'
    end
  end
end