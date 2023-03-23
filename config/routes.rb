Rails.application.routes.draw do

  root "landing#index"
  get "register", to: "users#new"
  
  resources :users, only: [:show, :new, :create] do
    get "/discover", to: "discover#index"
    
    resources :movies, only: [:show, :index]
  end
end
