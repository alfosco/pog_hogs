Rails.application.routes.draw do
  root to: 'home#home'
  get '/home', to: 'home#home'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


  namespace :admin do
    get 'dashboard', to: "dashboard#dashboard"
    resources :orders, only: [:show, :update]
    resources :items, except: [:delete]
  end

  resources :items, only: [:index]

  resources :users, only: [:new, :create, :edit, :update]
  get '/dashboard', to: "users#show"

  #resources :categories, path: ''
  #^^^ this removes categories so url is just '/slammers' but causes a nil error

  # resources :categories, only: [:show], as: :category do
  #   resources :items, only: [:show]
  # end

    resources :categories, only: [:show]
    resources :categories, controller: 'items', only: [:show]

  # get ':category/:item/:id', to: 'items#show', as: :category



  get '/carts', to: 'carts#index'
  post '/carts', to: 'carts#create'
  get '/cart', to: 'carts#show'
  put '/cart', to: 'carts#update'
  delete '/cart', to: 'carts#destroy'

  resources :orders, only: [:index, :show, :create]
end
