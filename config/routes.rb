Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "application#index"
  get "/register", to: "users#new"

  resources :users, only: [:index, :show, :create] do
    resources :movies, only: [:index, :create]
  end

  get "/users/:user_id/discover", to: "discover#discover"
  get "/users/:user_id/movies", to: "movies#index"
  get "/users/:user_id/movies/:movie_id", to: "movies#show"
  get "/users/:user_id/movies/:movie_id/viewing-party/new", to: "watch_parties#new"

end
