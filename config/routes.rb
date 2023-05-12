Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: %i[new create]
  resources :users, only: [:show], as: 'user_dashboard' do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show]
  end
end
