Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/register", to: 'users#create', as: 'new_user'
  resources :users, only: [:create] 
  get "/dashboard", to: 'users#create', as: 'user'
end
