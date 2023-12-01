Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index', as: 'landing'

  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new], controller: 'user_parties'
      post 'viewing_party', to: 'user_parties#create' # Handrolled, was adding a _index to prefix and idk why
    end
  end
end
