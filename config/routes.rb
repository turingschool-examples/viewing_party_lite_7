Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users, only: [:show, :new, :create]
  # get '/dashboard', to: 'users#show', as: 'dashboard'

  # get '/register', to: 'users#new'
  # post '/register', to: 'users#create'
end
