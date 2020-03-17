Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        resources :usermicroposts
      end
      resources :microposts
      resources :categorys
      post 'login/login'
    end
  end
end