Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'landing#index'

  post '/register', to: 'users#new'

  resources :register, only: [:create, :new], controller: :users
  resources :users, only: [:show]
end
