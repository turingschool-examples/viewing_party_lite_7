Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"

  get "/register", to: "users#new"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"

  get "/logout", to: "users#logout"
  # post "/register", to: "users#create"

  get "/users/:id/discover", to: "users#discover"
  get "/users/:id/movies", to: "users#movie_results"
  get "/users/:user_id/movies/:movie_id", to: "users#movie_details"

  resources :users, only: [:show, :create] do
    resources :movies, only: [:show] do
      resources :viewing_parties, :path => "viewing_party", only: [:new, :create], controller: "viewing_parties" 
    end
  end

  namespace :admin do 
    # resources :users, only: [:show], :path => "dashboard", controller: "admin/users#show"
    get "/dashboard", to: "admin#show"
    resources :users, only: [:show], controller: "users"
  end
end
