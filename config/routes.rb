Rails.application.routes.draw do
  root "welcome#index"
  get "/register", to: "users#new"

  resources :users, only: [:create, :show] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new]
    end
  end
end
