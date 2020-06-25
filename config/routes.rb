Rails.application.routes.draw do
  resources :missions
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root "missions#index"
end
