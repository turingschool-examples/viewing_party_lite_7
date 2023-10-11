Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/register', to: 'users#new', as: 'new_user'  

  resources :users do
    resources :movies, only: [:show]
  end
end
