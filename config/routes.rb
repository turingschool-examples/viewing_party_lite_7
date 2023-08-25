Rails.application.routes.draw do
  root to: "landing#index"

  resources :users, only: [:show, :create]

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/users/:id/discover", to: "discover#index"

  get "/users/:id/movies", to: "movies#index"
  get "/users/:id/movies", to: "movies#search"
  get "/users/:id/movies/:movie_id", to: "movies#show"
  
  get "/users/:id/movies/:movie_id/viewing_party", to: "viewing_parties#new"
  post "/users/:id/movies/:movie_id/viewing_party", to: "viewing_parties#create"
end
