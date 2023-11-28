Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "landing#index"

<<<<<<< HEAD
  resources :users, only: [:index, :show]
=======
  resources :users, only: [:index, :create, :new, :show]
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
>>>>>>> 425d9a2e482057226fa99321c6813cc982248c48
end
