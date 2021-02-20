Rails.application.routes.draw do
  root "users#index"
  resources :sessions, only:[:new, :create, :destroy]
  resources :users do
    resources :tweets, only:[:index, :new, :create, :destroy]
  end
  get "tweets/index"
end