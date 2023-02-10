Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "home", to: "pages#home"
  root "pages#home"

  resources :reviews, only: [:create]
  resources :requests, only: [:create]

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
