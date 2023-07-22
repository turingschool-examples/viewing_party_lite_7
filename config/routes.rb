# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies#index'
  get '/users/:user_id/movies', to: 'user_movies#index'
  get '/users/:user_id/movies/:movie_id', to: 'user_movies#show'
  get  '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'user_viewing_parties#new'
  post '/users/:id', to: 'user_viewing_parties#create'
  get '/login', to: "users#login_form"
  post '/login', to: 'users#login_user'
  delete "/login", to: "users#log_out_user"
  get "/dashboard", to: "users#show"

  resources :movies, only: [:show]
  resources :users, only: %i[index create show]
end
