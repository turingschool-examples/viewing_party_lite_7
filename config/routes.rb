Rails.application.routes.draw do
  root 'welcome#index'

  get 'discover', to: 'users#index', as: :discover
  get 'register', to: 'users#new', as: :new_user
  resources :users, only: [:create]
  get 'dashboard', to: 'users#show', as: :user

  resources :sessions, only: [:new, :create, :destroy]

  resources :movies, only: [:index, :show], controller: 'movies' do
    resources :viewing_party, only: [:new, :create], controller: 'movies/viewing_parties'
  end
end
