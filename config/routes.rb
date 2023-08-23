Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :movies, only: [:index]
end
