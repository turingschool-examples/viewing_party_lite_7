Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"

  
  get "/register", to: "users#new"
  
  resources :users, only: [:show, :create] do
    get "/discover", to: "users#discover"
    resources :movies, controller: "user_movies", only: [:index, :show] do 
      resources :viewing_party, only: [:new, :create]
    end
  end
end
