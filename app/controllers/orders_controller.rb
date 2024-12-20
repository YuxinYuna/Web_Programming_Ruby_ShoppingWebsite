class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    if user_signed_in?
      @orders = current_user.orders.order(created_at: :desc) # Fetch orders belonging to the logged-in user
    else
      @orders =[]

    end
  end

  def create
    if current_user.carts.any?
      # Create a new order
      order = current_user.orders.create(
        order_number: SecureRandom.hex(10), # Generate a unique order number
        total: current_user.carts.sum { |cart| cart.product.price * cart.quantity },
        status: "Pending"
      )
  
      # Attach cart items to order details
      order_details = current_user.carts.map do |cart|
        {
          product_id: cart.product.id,
          name: cart.product.name,
          price: cart.product.price,
          quantity: cart.quantity,
          image: cart.product.image_url.url,
          subtotal: cart.product.price * cart.quantity
        }
      end
  
      # Update the order with order details in JSON format
      order.update(order_details: order_details.to_json)
  
      # Update product stock based on the cart items' quantities
      current_user.carts.each do |cart|
        product = cart.product
        new_stock = product.stock - cart.quantity
        product.update(stock: new_stock)
      end
  
      # Clear the cart
      current_user.carts.destroy_all
  
      redirect_to orders_path, notice: "Your order has been placed successfully!"
    else
      redirect_to products_path, alert: "Your cart is empty. Add some products to place an order."
    end
  end
end
