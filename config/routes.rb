Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :products
      post '/auth/login', to: "authentication#login"
      get '/homepage', to: "homepage#index"

      post '/orders/mark-order', to: 'orders#mark_order', as: 'mark_order'
      resources :users
      resources :orders

      get '/users/:id/my-cart', to: 'users#show_cart', as: 'show_cart'
      put '/users/:id/add-to-cart/:product_id', to: 'orders#add_to_cart', as: 'add_to_cart'
      put '/users/:id/my-cart/:cart_id/:product_id', to: 'users#remove_from_cart', as: 'remove_from_cart'
      post '/users/:id/my-cart/:cart_id/create-order', to: 'orders#create_order', as: 'create_order'
    end
  end

  get 'sessions/new'

  get '/homepage', to: "homepage#index"
  get '/filter', to: "homepage#index"

  get '/admin', to: "users#show", as: 'admin'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :orders
  post '/users/:id/add-to-cart/:product_id', to: 'orders#add_to_cart', as: 'add_to_cart'
  post '/users/:id/my-cart/:cart_id/create-order', to: 'orders#create_order', as: 'create_order'
  post '/orders/mark-order', to: 'orders#mark_order', as: 'mark_order'
  resources :products
  resources :users
  get '/users/:id/my-cart', to: 'users#show_cart', as: 'show_cart'
  get '/users/:id/show-orders', to: 'users#show_orders', as: 'show_orders'
  post '/users/:id/my-cart/:cart_id/:product_id', to: 'users#remove_from_cart', as: 'remove_from_cart'
  get '/users/:id/show-orders/details', to: 'users#show_order_details', as: 'show_order_details'
  post '/users/make-admin', to: 'users#make_admin', as: 'make_admin'

  # Defines the root path route ("/")
  root "homepage#index"
end
