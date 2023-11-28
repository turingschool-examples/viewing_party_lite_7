Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'
  resources :users do
    get '/discover', to: 'users/discover#index'
  end
  get '/register', to: 'registration#new', as: 'register'
  post '/register', to: 'registration#create'
end
