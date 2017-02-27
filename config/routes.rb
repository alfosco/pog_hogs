Rails.application.routes.draw do
  root to: 'home#home'
  get '/home', to: 'home#home'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    get 'dashboard', to: "dashboard#dashboard"
  end

  resources :users, only: [:new, :create, :edit, :update]
  get '/dashboard', to: "users#show"

  #resources :categories, path: ''
  #^^^ this removes categories so url is just '/slammers' but causes a nil error

  resources :categories do
    resources :items, except: [:index]
  end

  get '/carts', to: 'carts#index'
  post '/carts', to: 'carts#create'
  get '/cart', to: 'carts#show'
  put '/cart', to: 'carts#update'

  resources :items, only: [:index]
  resources :orders, only: [:index, :show, :create, :update]
end
