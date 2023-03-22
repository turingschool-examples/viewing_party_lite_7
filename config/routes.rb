Rails.application.routes.draw do
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/register", to: "users#new"

  resources :users, only: [:show] do
    get "/discover", to: "movies#discover"
  end
end
