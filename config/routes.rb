Rails.application.routes.draw do
  devise_for :users
  resources :users,path: :profiles
  
  resources :timeline, only: :index
  root 'pages#index'
end
