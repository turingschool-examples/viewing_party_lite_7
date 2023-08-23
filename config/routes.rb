Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  
  resources :users do
    get "/discover", to: "discover_movies#search"
    get "/movies", to: "discover_movies#index"
  end

  get "/register", to: "users#new"
end
