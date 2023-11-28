Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "landing#index"

  resources :users, only: [:index, :create, :new, :show] do
    resources :parties, only: :index, path: 'discover'
  end

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
end
