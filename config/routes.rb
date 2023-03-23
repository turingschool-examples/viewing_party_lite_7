Rails.application.routes.draw do

  root "landing#index"
  get "register", to: "users#new"
  
  resources :users, only: [:show, :new, :create] do
    get "/discover", to: "discover#index"
    
    resources :movies, only: [:show, :index]
  end

  get "/users/:user_id/movies/:movie_id/viewing-party/new", to: "viewing_parties#new"
end
