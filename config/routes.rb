Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'welcome#index', as: 'landing'
  
  get '/register', to: 'users#new', as: 'register_user'
  resources :users, only: [:show, :create]
end
