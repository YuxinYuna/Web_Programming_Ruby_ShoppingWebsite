class OrdersController < ApplicationController
  before_action :authenticate_user! # Require login to place an order

  def create
    @cart_items = current_user.carts.includes(:product)
    order_details = @cart_items.map do |item|
      {
        product_name: item.product.name,
        price: item.product.price,
        quantity: item.quantity
      }
    end

    total = @cart_items.sum { |item| item.product.price * item.quantity }

    @order = current_user.orders.new(
      order_number: SecureRandom.hex(10),
      order_details: order_details,
      total: total,
      status: 'pending'
    )

    if @order.save
      @cart_items.destroy_all # Clear the cart after placing the order
      redirect_to orders_path, notice: 'Order placed successfully!'
    else
      redirect_to carts_path, alert: 'Failed to place the order.'
    end
  end
end
