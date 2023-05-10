# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :users, only: [:show] do
    get 'discover', to: 'users/discover#index', as: 'discover'
  end

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'

end
