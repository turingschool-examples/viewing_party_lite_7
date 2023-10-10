# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/register", to: "users#new"
  # resources :register, only: [], controller: "users#new"
  resources :users, only: [:show, :create]
end
