Rails.application.routes.draw do
  root "users#index"
  resources :sessions, only:[:new, :create, :destroy]
  resources :users do
    resources :tweets, only:[:index, :new, :create, :edit, :update]
  end
  delete "tweets/:id",to: "tweet#destroy"
end