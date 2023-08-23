Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  
  resources :users do
    get "/discover", to: "discover_movies#search"
    get "/movies", to: "discover_movies#index"
  end

  get "/register", to: "users#new"

end
