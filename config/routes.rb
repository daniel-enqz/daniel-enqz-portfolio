Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "home", to: "pages#home"

  # Defines the reviews path route ("/reviews")
  resources :reviews, only: [:create]
end
