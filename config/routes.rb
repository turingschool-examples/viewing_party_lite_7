Rails.application.routes.draw do

  root "welcome#index"
  get "/register", to: "users#new"

  resources :users, only: [:create, :show] do
    get "/discover", to: "movies#discover"
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end
end
