Rails.application.routes.draw do
  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end
  # Devise routes for user authentication
  devise_for :users

  # Set the shop page (products#index) as the root page
  root to: "products#index"

  # Additional routes for resources
  resources :products
  resources :carts, only: [ :index, :create, :destroy ] do
    delete "remove_item", on: :collection # Custom route for guests using product_id
  end
  resources :orders, only: [ :index, :create ]
end
