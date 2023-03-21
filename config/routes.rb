Rails.application.routes.draw do

  root "landing#index"
  
  resources :user, only: [:show] do
    member do 
      get 'dashboard'
    end
  end
end
