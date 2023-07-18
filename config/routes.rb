Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies
  
  resources :users, only:[:index, :show, :new, :create] do
    resources :discover, only:[:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create, :index]
    end
    resources :search, only: [:search]
  end

  get "/", to: "users#landing", controller: [:user]

  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
end
