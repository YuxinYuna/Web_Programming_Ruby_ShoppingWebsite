class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:index] # Require login to view the cart

  def index
    @cart_items = current_user.carts.includes(:product) # Only show authenticated user's cart
  end

  def create
    if user_signed_in?
      @cart = current_user.carts.find_or_initialize_by(product_id: params[:product_id])
      @cart.quantity += params[:quantity].to_i
      if @cart.save
        redirect_to carts_path, notice: 'Product added to your cart.'
      else
        redirect_to products_path, alert: 'Unable to add product to your cart.'
      end
    else
      # Save cart in session for unauthenticated users
      session[:cart] ||= []
      session[:cart] << { product_id: params[:product_id], quantity: params[:quantity].to_i }
      redirect_to products_path, notice: 'Product added to your cart. Log in to place an order.'
    end
  end

  def destroy
    if user_signed_in?
      @cart_item = current_user.carts.find(params[:id])
      @cart_item.destroy
      redirect_to carts_path, notice: 'Item removed from your cart.'
    else
      # Logic to remove from session[:cart] for unauthenticated users
      session[:cart]&.delete_at(params[:id].to_i)
      redirect_to products_path, notice: 'Item removed from your cart.'
    end
  end
end

