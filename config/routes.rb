Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/register", to: "users#new"

  resources :users, only: [:create, :show] do
    get "/discover", to: "users#discover"
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: :new
    end
  end

  resources :viewing_parties, only: :create

end
