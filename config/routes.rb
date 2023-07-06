Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get '/register', to: 'users#new'
  
  resources :users, only: [:show, :create] do
    get '/discover', to: 'users/discover#index'
    get '/movies', to: 'users/movies#index'
  end
end

