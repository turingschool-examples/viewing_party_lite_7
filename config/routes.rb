# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :users, only: [:show] do
    get 'discover', to: 'users/discover#index', as: 'discover'
    get 'movies', to: 'users/movies#index', as: 'movies'
    # post 'movies', to: 'users/movies#index'
    # get "/:id/movies?q=keyword", to: 'users/movies#index', as: 'movies'
    # get "/:id/movies?q=top%20rated", to: 'users/movies#index', as: 'movies'
    # get '/:id/movies', to: 'users/movies#index', as: 'movies', constraints: { "q=top%20rated" }
    # get '/:id/movies', to: 'users/movies#index', as: 'movies', constraints: { "q=keyword" }
  end

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'

end
