# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'application#home'
  get "/register", to: "users#new"
  get "/users/:id/discover", to: "users#discover"

  resources :users, only: [:index, :create, :show]
end
