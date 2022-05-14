Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'home', to: 'pages#home'
  get 'projects', to: 'pages#projects'
  get 'about', to: 'pages#about'
  get 'stack', to: 'pages#stack'
end
