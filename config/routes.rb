Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "application#welcome"

  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/discover", to: "movies#discover", as: "discover"
  get "/register", to: "users#new", as: "register"
  
  get "/users/:id/movies", to: "movies#index", as: "movies"
  post "/users/:id/movies", to: "movies#index", as: "search"

  # post "/search", to: "search#search"

  resources :users, only: [:create]
end
