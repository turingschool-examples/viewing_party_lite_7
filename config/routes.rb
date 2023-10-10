Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/register', to: 'users#new', as: 'new_user'  

  resources :users, only: [:create, :show]
end
