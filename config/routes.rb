Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index', as: :root

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get 'users/:id', to: 'users#show', as: :user_dashboard
  get '/users/:id/discover', to: 'users/discover#index', as: :user_discover
  get '/users/:id/movies', to: 'movies#index', as: :top_rated_movies
  get '/users/:id/movies/:movie_id', to: 'movies#show', as: :movie_show
end
