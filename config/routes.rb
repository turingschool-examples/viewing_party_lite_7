# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  
  get 'register', to: 'users#new', as: :new_user
  get "/users/:id", to: "users#index"
  post "/users/:id/discover", to: "users#create"
end
