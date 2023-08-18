Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/", to: "application#index"
  root "landing#index"

  resources :users, only: [:index, :show, :create] do
    resources :movies, only: [:index, :create]
    get "discover", to: "discover#discover"
    get "movies/:movie_id", to: "movies#show"
    get "movies/:movie_id/viewing-party/new", to: "watch_parties#new"
    # post "watch_parties", to: "watch_parties#create"
  end
  post "/users/:user_id", to: "watch_parties#create"

  get "/register", to: "users#new", as: :register_user
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/exit", to: "sessions#destroy", as: :logout


  # get "/users/:user_id/discover", to: "discover#discover"
  # get "/users/:user_id/movies", to: "movies#index"
  # get "/users/:user_id/movies/:movie_id", to: "movies#show"
  # get "/users/:user_id/movies/:movie_id/viewing-party/new", to: "watch_parties#new"

end
