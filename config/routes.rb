Rails.application.routes.draw do
  resources :missions
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  root "missions#index"
end
