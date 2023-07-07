Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "landing#index"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  # get "/users/:id/discover", to: "discover#index"

  resources :users, only: [:show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index]
  end

end
