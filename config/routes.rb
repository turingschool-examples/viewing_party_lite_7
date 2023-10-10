Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/register', to: 'users#new', as: 'new_user'  

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
    end
  end
end
