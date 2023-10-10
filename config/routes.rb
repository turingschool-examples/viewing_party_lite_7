Rails.application.routes.draw do

  root "welcome#index"

  # Defines the root path route ("/")
  # root "articles#index"
  get "/register", to: "users#new"

  resources :users, only: [:new, :create, :show] do
    get "/discover", to: "movies#index"
  end

end
