Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "home", to: "pages#home"
  root "pages#home"

  resources :reviews, only: [:create]
  resources :requests, only: [:create]
end
