Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  resources :users, only: [:new, :create, :show] do
    # resources :discover, only: [:index]
  end

  get "/users/:id/discover", to: "movies#index"
  get "/users/:id/movies", to: "movies#search"

end
