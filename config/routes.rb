# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  # Defines the root path route ("/")
  # root "articles#index"

  get '/register', to: 'users#new'
  post '/register' => 'users#create', as: 'users'
  resources :users, only: [:show] do
    get '/discover', to: 'users#index'
    resources :movies, only: %i[index show] do
      resources :viewing_party, only: %i[new create]
    end
  end
end
