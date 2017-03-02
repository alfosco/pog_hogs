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

  resources :items, only: [:show] do
    resources :reviews
  end

  get '/carts', to: 'carts#index'
  post '/carts', to: 'carts#create'
  get '/cart', to: 'carts#show'
  put '/cart', to: 'carts#update'
  delete '/cart', to: 'carts#destroy'

  resources :orders, only: [:index, :show, :create]

  resources :categories, path: '', only: [:show] do
    resources :items, only: [:show]
  end

end
