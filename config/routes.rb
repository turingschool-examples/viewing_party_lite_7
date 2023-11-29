# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:index, :show] do
    resources :discover, only: [:index], controller: 'users/discover'
  end
end
