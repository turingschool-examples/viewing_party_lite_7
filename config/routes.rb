Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  resources :register, only: [:create], controller: 'users'


  resources :users, only: [:show] do
    resources :discover, only: [:index]
    resources :movies, only: [:show] do
      resources :viewing_party, only: [:new, :create], path: '/viewing-party'
    end
  end

end
