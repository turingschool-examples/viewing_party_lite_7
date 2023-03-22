Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get "/register", to: "users#new"

  resources :users, only: [:show, :create]  do
    get "/discover", to: "movies#discover"
  end
end
