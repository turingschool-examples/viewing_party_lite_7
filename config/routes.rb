Rails.application.routes.draw do
  root 'welcome#index'
  resources :user, only: %i[new show]
end
