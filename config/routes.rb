Rails.application.routes.draw do
  root to: "landing#index"

  resources :users, only: [:show, :create]
  get "/register", to: "register#new"
end
