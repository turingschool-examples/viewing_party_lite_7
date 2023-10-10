Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'

  resources :users, only: [:new, :create]
end
