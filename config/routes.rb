Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index', as: :root
  get 'users/:id', to: 'users#show', as: :user_dashboard
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/discover', to: 'users/discover#index', as: :user_discover
  get '/users/:id/movies', to: 'movies#index', as: :top_rated_movies
end
