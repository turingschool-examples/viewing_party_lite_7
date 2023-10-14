# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/register', to: 'users#new', as: 'new_user'
  get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new', as: 'new_viewing_party'
  post '/users/:user_id/movies/:movie_id/viewing-party', to: 'viewing_parties#create', as: 'create_viewing_party'

  resources :users do
    get 'discover', on: :member
    resources :movies, only: %i[index show]
  end
end
