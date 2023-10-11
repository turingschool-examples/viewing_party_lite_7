Rails.application.routes.draw do

  root "welcome#index"

  # Defines the root path route ("/")
  # root "articles#index"
  get "/register", to: "users#new"

  resources :users, only: [:index, :new, :create, :show] do
    get "/discover", to: "users#index"
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new]
    end
  end

end
