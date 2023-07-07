# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'application#home'
  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies#index'
  get '/users/:user_id/movies', to: 'user_movies#index'
  get '/users/:user_id/movies/:movie_id', to: 'user_movies#show'

  resources :movies, only: [:show]
  resources :users, only: %i[index create show]
end
