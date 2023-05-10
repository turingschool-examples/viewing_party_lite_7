Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"


  
  #user paths
  get '/register', to: 'user#new', as: 'new_user'
  post '/register', to: 'user#create'
  get '/users/:id', to: 'user#show', as: 'user'
end