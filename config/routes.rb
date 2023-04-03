Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/register', to: 'users#new'
    #For the new form_with model to work this route MUST be named /users and NOT /register!!!
  post '/users', to: 'users#create'

  get "/users/:id", to: "users#show"

  get "/users/:id/discover", to: "users/discover#index"
  
  get "/users/:id/movies", to: "users/movies#index"
  get "/users/:id/movies/:movie_id", to: "users/movies#show"

  # Non-RESTful Routes:
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"

  get "/users/:user_id/movies/:movie_id/viewing_party/new", to: "users/viewing_parties#new"
  post "/users/:user_id/movies/:movie_id/viewing_party", to: "users/viewing_parties#create"
end
