# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root "users#index"
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'discover#index'
  # get '/users/:id/movies', to: 'movies#top_movies'
  get '/users/:id/movies', to: 'movies#search'
  get '/users/:id/movies/:movies_id', to: 'movies#show'
  get '/users/:id/movies/:movies_id/viewing_parties/new', to: 'viewing_parties#new'
  post '/users/:id/movies/:movies_id/viewing_parties', to: 'viewing_parties#create'
  get '/register', to: 'users#new'
  # get '/new', to: 'users#new'
  post '/users/:id', to: 'users#create'
  post '/register', to: 'users#create'
end
