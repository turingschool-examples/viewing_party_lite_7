Rails.application.routes.draw do

  get "/register", to: "users#new"
  resources :users, only: [:create, :show] do
    get "/discover", to: "movies#discover"
    resources :movies, only: [:index, :show]
  end
  root "welcome#index"

end
