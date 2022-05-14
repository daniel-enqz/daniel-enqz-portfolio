Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'stack', to: 'pages#stack'

  get 'projects', to: 'projects#index'
end
