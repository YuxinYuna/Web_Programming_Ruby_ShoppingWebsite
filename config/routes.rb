Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Set the shop page (products#index) as the root page
  root to: 'products#index'

  # Additional routes for resources
  resources :products
  resources :carts, only: [:index, :create, :destroy]
  resources :orders, only: [:index, :create]
end
