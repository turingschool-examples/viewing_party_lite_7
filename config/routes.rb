Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "landing#index"

  resources :users, only: [:index, :create, :new, :show] do
    resources :user_parties, only: :index, path: 'discover', as: 'discover'
    
    resources :movies, only: :index, as: 'results'
    resources :movies, only: :show do
      resources :user_parties, only: [:new, :create], path: 'viewing_party', as: 'viewing_party'
    end
  end

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
end
