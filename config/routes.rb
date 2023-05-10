Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', controller: 'users', to: 'users#new'
  post '/register', controller: 'users', to: 'users#create'
  
  resources :users
  resources :user_viewing_parties
  resources :viewing_parties
end
