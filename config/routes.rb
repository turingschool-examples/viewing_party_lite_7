Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'

  resources :users, only: %i[new show create]
end
