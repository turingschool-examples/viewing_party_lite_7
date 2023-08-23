Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  get '/register', to: 'users#register', as: 'register_user'
  post '/register', to: 'users#create'

  resources :users, only: [:show] do
    get "/discover", to: "users#discover"
  end
