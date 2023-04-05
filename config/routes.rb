Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/logout', to: 'users#logout'
  delete '/logout', to: 'users#logout'

  get "/dashboard", to: "users#show"

  get "/register", to: "users#new"

  post "/register", to: "users#create"

  # resources :movies, only: [:index, :show]
  resources :users, only: [:create, :show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create], controller: 'parties'
    end
  end
end
