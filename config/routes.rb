Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  resources :users do
    resources :discover, controller: 'users/discover', only: :index
    get '/movies', to: 'users/discover/results#index'
    get '/movies/:id', to: 'users/discover/results#show'
    get '/movies/:id/parties/new', to: 'users/discover/results/parties#new'
    post '/movies/:id/parties', to: 'users/discover/results/parties#create'
    # resources :movies, controller: 'users/discover/results', only: [:index, :show]
      # resources :parties, controller: 'users/discover/results/parties', only: [:new, :create]
  end

  # resources :register, controller: 'registration', only: [:new, :create], path: 'register'
  get '/register', to: 'registration#new', as: 'register'
  post '/register', to: 'registration#create'
  # match 'register', to: 'registration', via: [:get, :post]
end
