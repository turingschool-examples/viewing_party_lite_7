Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:new, :create]
  resources :users, only: [:show], as: 'user_dashboard'
end
