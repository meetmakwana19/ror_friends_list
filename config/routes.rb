Rails.application.routes.draw do
  devise_for :users 
  resources :friends
  get 'home/index'
  get 'home/about'
  # root 'home#index'
  root 'friends#index' #inside the friends_Controller, use index route
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
