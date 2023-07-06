Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "application#index"
  get "/register", to: "users#new"

  resources :users, only: [:index, :show, :create] do
    resources :discover, only: [:index], controller: 'movies'
  end
  resources :movies, only: [:show]
end
