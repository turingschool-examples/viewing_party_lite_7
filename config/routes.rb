Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get "/register", to: "users#new"

  resources :users, only: [:show, :create]  do
    resources :movies, only: [:index, :show] 
    get "/discover", to: "movies#discover", as: "movies_discover"
  end
end
