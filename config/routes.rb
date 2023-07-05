Rails.application.routes.draw do
  resources :viewing_party_users
  resources :viewing_parties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  resources :users, only: [:show, :create]

  get "/register", to: "users#new"
end

# this comment is to test pr requests