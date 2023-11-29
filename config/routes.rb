# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "users/:id", to: "users#show"
  get '/users/:id/discover', to: 'users/discovers#index', as: :user_discover
end
