Rails.application.routes.draw do
  resources :missions
  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
    post "session/:id", to: "users#create_admin", as: :session
  end
  root "missions#index"
end
