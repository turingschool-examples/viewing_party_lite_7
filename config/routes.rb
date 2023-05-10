# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users, only: [:new, :create, :show] do
    member do
      get 'discover'
      resources :movies, only: [:index, :show]
    end
  end
end
