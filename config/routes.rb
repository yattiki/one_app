Rails.application.routes.draw do
  root "users#index"
  resources :sessions, only:[:new, :create, :destroy]
  resources :users
  resources :tweets, only:[:new, :create, :edit, :update, :destroy]
  get "tweets/index"
end