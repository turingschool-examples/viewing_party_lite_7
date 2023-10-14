Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/register', to: 'users#new', as: 'new_user'
  get '/users/:user_id/movies/:movid_id/viewing-party/new', to: 'viewing_parties#new', as: 'new_viewing_party'

  resources :users do
    get 'discover', on: :member
    resources :movies, only: [:index, :show]
  end
end
