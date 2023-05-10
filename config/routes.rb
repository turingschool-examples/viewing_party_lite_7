Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'landing#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/dashboard/:user_id', to: 'users#show', as: 'dashboard'

  get '/discover/users/:user_id', to: 'discover/users#show'

  get '/movies', to: 'movies#index'
end
