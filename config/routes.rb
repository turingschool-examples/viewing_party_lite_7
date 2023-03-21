Rails.application.routes.draw do
  resources :user, only: [:show] do
    member do 
      get 'dashboard'
      get 'discover'
    end
  end
end
