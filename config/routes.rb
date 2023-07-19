# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get "register", to: "users#new", as: :new_user

  get "/login", to: "session#login_form"
  post "/login", to: "session#login"
  get "/logout", to: "session#logout", as: :logout
  get "/dashboard", to: "users#show", as: :dashboard

  get "/discover", to: "discover#index"

  resources :movies, only: [:index, :show] do
    resources :viewing_party, only: [:new, :create], controller: "viewing_parties"
  end

  resources :users, only: [:create, :show] do
  end
end
