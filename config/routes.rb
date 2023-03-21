Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "landing#index"
  resources :users, only: [:new, :create, :show] do 
    get 'dashboard', on: :member
  end 

  get "/users/:id/discover", to: "discover#index"
end
