Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: %i[new create show]
end
