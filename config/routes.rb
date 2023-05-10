# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/users/:id/discover', to: 'movies_search#index'
  get '/users/:user_id/movies', to: 'movies#index'
  resources :users, only: %i[new show create]
end
