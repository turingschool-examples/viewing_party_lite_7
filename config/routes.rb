Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "landing#index"
  
  resources :users, only: [:new, :create, :show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
  end
  
  get "/users/:user_id/movies/:movid_id/viewing-party/new", to: "viewing_parties#new"
  post "/users/:user_id/movies/:movid_id/viewing-party/create", to: "viewing_parties#create"
end
