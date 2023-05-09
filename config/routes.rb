Rails.application.routes.draw do
  root "welcome#index"
  resources :user, only: [:new, :show]
end
