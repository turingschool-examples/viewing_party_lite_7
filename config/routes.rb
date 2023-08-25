Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    root to: "landing_page#index"
    get "/search", to: "search#index"
    post "/search", to: "search#search"
      
    resources :users, only: [:create, :show] do
      resources :discover, only: [:index], controller: "users/discovers"
      resources :movies, only: [:index, :show], controller: "users/movies" do
        resources :viewing_parties
      end
    end


    resources :register, only: [:new, :create, :show]

end
