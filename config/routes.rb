Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:show]
  get "/users/:id/discover", to: "movies#index"
  get "/users/:id/movies", to: "movies#search"
  get "/users/:id/movies/:movie_id", to: "movies#show"

  root "welcome#index"
  get "/register/new", to: "users#new"
  post "/register", to: "users#create"
end
