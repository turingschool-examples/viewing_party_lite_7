Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root "users#index"
  get "/", to: "users#index"
  get "/register", to: "users#new"
  # get "/new", to: "users#new"
  post "/", to: "users#create"
  get "/users/:id", to: "users#show"
end
