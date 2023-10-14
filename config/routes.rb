# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'landing_page#index'

  resources :users, only: %i[show new create] do 
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do 
      resources :viewing_parties, only: [:new, :create]
    end
  end
end
