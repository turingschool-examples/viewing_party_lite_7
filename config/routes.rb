Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies
  resources :users, only: [:show] 
  #   resources :dashboard, only: [:index]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/", to: "application#landing", controller: [:user]
end
