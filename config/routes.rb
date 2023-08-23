Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  
  resources :users do
    get "discover", on: :member
    # , to: "users#discover"
    get "movies", on: :member, to: "discover_movies#index"
  end

  get "/register", to: "users#new"
end
