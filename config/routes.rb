Rails.application.routes.draw do
  get 'sessions/new'

  get 'homepage', to:"homepage#index"
  get '/filter', to:"homepage#index"

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  # Defines the root path route ("/")
  root "homepage#index"
end
