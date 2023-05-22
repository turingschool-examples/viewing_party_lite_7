Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  resources :users, only: %i[create]
  resources :users, only: [:show], as: 'user_dashboard' do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :viewing_parties, only: %i[new create]
    end
  end
end
