# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show] do
    resources :movies, only: [:show]
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/:id', to: "users#show"
  
  get "/users/:id/discover", to: "user_discovers#index"

  get "/users/:id/movies", to: "user_movies#index"
end
