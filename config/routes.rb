Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies
  namespace :users do
    resources :register, only:[:index, :show, :create]
    
  end
  resources :users, only:[:show] do
    resources :discover, only:[:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new]
    end
    resources :search, only: [:search]
  end
  
  get "/", to: "application#landing", controller: [:user]
end
