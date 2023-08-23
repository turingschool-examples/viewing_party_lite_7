Rails.application.routes.draw do
  root to: "landing#index"

  resources :users, only: [:show, :create]
  get "/register", to: "users#new"
  post "/register", to: "users#create"
end
