# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"

  get "/users/:id/discover", to: "discover#new"
  resources :users, only: %i[show create]
  resources :discover, only: :new
end
