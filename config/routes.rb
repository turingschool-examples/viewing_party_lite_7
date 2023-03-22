Rails.application.routes.draw do

  root "landing#index"
  get "register", to: "user#new"
  
  resources :user, only: [:show, :new, :create] do
    get "/discover", to: "discover#index"
    
    resources :movies, only: [:show, :index]
  end
end
