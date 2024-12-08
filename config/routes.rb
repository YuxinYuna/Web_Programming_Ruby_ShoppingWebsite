Rails.application.routes.draw do
  # Set the shop page (products#index) as the root page
  root to: "products#index"

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :products
    resources :orders
  end

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end
  # Devise routes for user authentication
  devise_for :users

  # Additional routes for resources
  resources :products, only: [ :index, :show ]
  resources :carts, only: [ :index, :create, :destroy ] do
    member do
      patch :update
    end
    delete "remove_item", on: :collection # Custom route for guests using product_id
  end
  resources :orders, only: [ :index, :create ]
end
