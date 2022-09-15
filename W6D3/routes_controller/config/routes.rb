Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/users', to: "users#index"
  # get '/users/new', to: "users#new"
  # post '/users', to: "users#create"
  # get '/users/:id', to: "users#show"
  # get '/users/:id/edit', to: "users#edit"
  # patch '/users/:id', to: "users#update"
  # delete '/users/:id', to: "users#destroy"

  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :artworks, only: [:index, :create, :show, :update, :destroy]
  resources :artworkshares, only: [:index, :create, :show, :destroy]

end

