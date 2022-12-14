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
  resources :artworks, only: [:create, :show, :update, :destroy]
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]


  resources :users do
    resources :artworks, only: [:index]
  end

  resources :users do
    resources :comments, only: [:index]
  end
end

