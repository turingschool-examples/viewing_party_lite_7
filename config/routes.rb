Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/register', to: 'user#new', as: 'new_user'
  post '/register', to: 'user#create'
end
