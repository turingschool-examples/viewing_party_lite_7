Rails.application.routes.draw do
  resources :users, only: [:show] do
    get "discover", on: :member
    get "movies", on: :member
  end

  resources :movies, only: [:index]
end
