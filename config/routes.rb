Rails.application.routes.draw do

  root "landing#index"
  get "register", to: "users#new"
  
  resources :users, only: [:show, :new, :create] do
    get "/discover", to: "discover#index"
    
    resources :movies, only: [:show, :index]
  end

  resources :dashboard, only: [:index]

  get "/users/:user_id/movies/:movie_id/viewing-party/new", to: "viewing_parties#new"
  post "/users/:user_id/movies/:movie_id/viewing-party/new", to: "viewing_parties#create"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"
  delete "/logout", to: "users#logout_user"
end
