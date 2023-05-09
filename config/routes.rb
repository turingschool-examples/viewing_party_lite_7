# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users, only: [:new, :create]

  get '/users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
end
