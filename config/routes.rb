Rails.application.routes.draw do
  root 'welcome#index'

  get 'register', to: 'users#new', as: :new_user
  get 'dashboard', to: 'users#show', as: :user

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:create] do
    get 'discover', to: 'users/discover#index'
    resources :movies, only: [:index, :show], controller: 'users/movies' do
      resources :viewing_party, only: [:new, :create], controller: 'users/movies/viewing_parties'
    end
  end
end
