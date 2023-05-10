Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'landing#index'

  post '/register', to: 'users#new'

  resource :register, only: [:index], controller: :users
  resource :users, only: [:show]
end
