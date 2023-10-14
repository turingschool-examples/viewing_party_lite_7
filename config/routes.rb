Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  
  resources :users, only: [:show, :new, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:create, :new, :show]
    end
  end

  get "/users/:user_id/movies/:movie_id/viewing_party/new", to: "viewing_parties#new"

  post "/users/:user_id/movies/:movie_id/viewing_party/new", to: "viewing_parties#create"
  
  get '/register', to: 'users#create'
  # get '/dashboard', to: 'users#show', as: 'dashboard'

  # get '/register', to: 'users#new'
  # post '/register', to: 'users#create'
end
