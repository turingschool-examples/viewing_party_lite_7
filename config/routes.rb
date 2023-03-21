Rails.application.routes.draw do

  root "landing#index"
  get "register", to: "user#new"
  
  resources :user, only: [:show, :new, :create] do
    member do 
      get 'dashboard'
      get 'discover'
    end
  end
end
