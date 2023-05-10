Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', controller: 'users', to: 'users#new'
  post '/register', controller: 'users', to: 'users#create'

  resources :users do
    # get '/users/:id/discover', to: 'discover#index'
    resources :discover, only: [:index], controller: 'users/discover'
    # resources :movie, only: [:show], controller: 'user/movies'
  end
  resources :user_viewing_parties
  resources :viewing_parties
end
