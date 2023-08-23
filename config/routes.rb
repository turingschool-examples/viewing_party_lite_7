Rails.application.routes.draw do

  get "/register", to: "users#new"
  resources :users, only: [:create, :show]
  root "welcome#index"

end
