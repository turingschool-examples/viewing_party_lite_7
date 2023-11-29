Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index', as: :root
  get 'users/:id', to: 'users#show'
  post '/users/new', to: 'users#new', as: :new_user_path
  get '/users/:id/discover', to: 'users/discovers#index', as: :user_discover
end
