Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "application#welcome"

  get "/register", to: "users#new"
  get "/users/:user_id", to: "users#dashboard"
  get "/users/:user_id/discover", to: "movies#discover"
  get "/users/:user_id/movies", to: "movies#index"

  resources :users, only: [:create]
end
