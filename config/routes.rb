Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  resources :users do
    resources :discover, controller: 'users/discover', only: :index
    resources :movies, controller: 'users/discover/results', only: [:index, :show] do
      resources :parties, controller: 'users/discover/results/parties', only: [:new, :create]
    end
  end

  # resources :register, controller: 'registration', only: [:new, :create], path: 'register'
  get '/register', to: 'registration#new', as: 'register'
  post '/register', to: 'registration#create'
  # match 'register', to: 'registration', via: [:get, :post]
end
