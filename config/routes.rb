Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :users, only: [:show, :create] do
    get "/discover", to: "discover#index"
    get "/movies", to: "movies#index"
  end

  get "/register", to: "users#new", as: "new_user"
end
