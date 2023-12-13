Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index', as: :root

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/users', to: 'users#logout', as: :logout

  get '/dashboard', to: 'users#show', as: :user_dashboard
  get '/discover', to: 'users/discover#index', as: :user_discover
  get '/movies', to: 'movies#index', as: :top_rated_movies
  get '/movies/:movie_id', to: 'movies#show', as: :movie_show
  get '/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
  post '/users/:id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#create', as: :viewing_party_form
end
