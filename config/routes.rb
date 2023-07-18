Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies
  
  resources :users, only:[:show] do
    resources :discover, only:[:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create, :index]
    end
    resources :search, only: [:search]
  end

  root "sessions#landing"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  resources :sessions, only: [:new, :create, :destroy]
end
