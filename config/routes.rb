Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'welcome#index', as: 'landing'
  
  get '/register', to: 'users#new', as: 'register_user'
  post '/register', to: 'users#create'

  resources :users, only: [:show] do
    resources :discover, only: [:index]
  end
end
