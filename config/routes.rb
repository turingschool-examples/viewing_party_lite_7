Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    root to: "landing_page#index"

  
    resources :users, only: [:create, :show] do
      resources :discover, only: [:index], controller: "users/discovers"
      resources :movies, only: [:index], controller: "users/movies"
    end


    resources :register, only: [:new, :create, :show]

end
