Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  
  resources :users do
    get "discover", on: :member
    # , to: "users#discover"
    get "movies", to: "discover_movies#index"
    get "movies/:movie_id", to: "movie_details#show"
    get "movies/:movie_id/viewing-party/new", to: "viewing_parties#new"
  end

  get "/register", to: "users#new"
end
