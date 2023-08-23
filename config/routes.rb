Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"

  
  get "/register", to: "users#new"
  
  resources :users, only: [:show, :create] do
    resources :discover, only: [:index] 
  end
end
