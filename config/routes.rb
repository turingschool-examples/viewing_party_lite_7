Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "application#index"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"
  delete "/logout", to: "sessions#destroy", as: :logout
  get '/register', to: 'users#new'
  post '/users/:id', to: 'viewing_party#create'

  resources :users, only: [:show, :create] do
    resources :movies, only: [:index, :show], on: :member do
      resources :viewing_party, only: [:new]
    end
    get 'discover', on: :member
  end

end
