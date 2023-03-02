Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :pages, only: %i[index home]
  resources :drags do
    resources :bookings, only: %i[new create index edit update]
  end
  resources :bookings, only: [:destroy]
  get "/dashboard", to: "pages#dashboard"
end
