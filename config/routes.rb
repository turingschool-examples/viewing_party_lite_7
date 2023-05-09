Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', controller: 'users', to: 'users#new'

  resources :users
  resources :user_viewing_parties
  resources :viewing_parties
end
