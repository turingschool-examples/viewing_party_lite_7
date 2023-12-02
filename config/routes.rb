Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show] do
    member do
      get 'discover'
    end
    resources :movies, only: %i[index show] do
      resources :viewing_party, only: [:new]
    end
  end
end
