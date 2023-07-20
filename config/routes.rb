Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies, only: [:index, :show]
  
  resources :users, only:[:show] do
    resources :movies, only: [:index, :show], controller: "user/movies" do
      resources :viewing_parties, only: [:new, :create, :index]
    end
    # resources :movies, only:  do
    # end
    resources :search, only: [:search]
  end

  root "sessions#landing"
  get "/discover", to: "discover#index"
  get "/users/:user_id/discover", to: "user/discover#index", as: "user_discover"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/login", to: "sessions#logout"
  resources :sessions, only: [:new, :create]
end
