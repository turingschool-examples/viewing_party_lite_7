# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users, only: [:new, :create, :show] do
    get 'discover', on: :member
    get 'movies', on: :member
  end

  # get '/users/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
end
