Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  delete '/logout', to: 'users#logout_session'
  get '/dashboard', to: 'users#show'
  get '/dashboard/discover', to: 'discover#index'
  get '/dashboard/movies', to: 'movies#index'
  get '/dashboard/movies/:id', to: 'movies#show'
  get '/dashboard/movies/:id/viewing_parties/new', to: 'viewing_parties#new'
  post '/dashboard/movies/:id/viewing_parties', to: 'viewing_parties#create'
  resources :users, only: %i[create] 
    
end
