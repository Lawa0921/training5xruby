Rails.application.routes.draw do
  resources :missions
  root "missions#index"
end
