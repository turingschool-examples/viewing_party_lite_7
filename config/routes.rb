Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    resources :register, only: [:new, :create, :show]
    resources :users, only: [:create, :show]
end
