require 'ostruct'

class CartsController < ApplicationController
  # before_action :authenticate_user!, only: [ :index ] # Require login to view the cart

  def index
    if user_signed_in?
      @cart_items = current_user.carts.includes(:product) # Show authenticated user's cart
    else
      # Fetch the cart items from session for unauthenticated users
      @cart_items = (session[:cart] || []).map do |item|
        product = Product.find_by(id: item["product_id"])
        next unless product

        OpenStruct.new(
          id: item["product_id"],
          product: product,
          quantity: item["quantity"]
        )
      end.compact
    end
  end

  def create
    if user_signed_in?
      @cart = current_user.carts.find_or_initialize_by(product_id: params[:product_id])
      @cart.quantity += params[:quantity].to_i
      if @cart.save
        redirect_to carts_path, notice: "Product added to your cart."
      else
        redirect_to products_path, alert: "Unable to add product to your cart."
      end
    else
      # Save cart in session for unauthenticated users
      session[:cart] ||= []
      existing_item = session[:cart].find { |item| item['product_id'] == params[:product_id].to_s }
      if existing_item
        existing_item['quantity'] += params[:quantity].to_i
      else
        session[:cart] << { 'product_id' => params[:product_id], 'quantity' => params[:quantity].to_i }
      end
      redirect_to carts_path, notice: "Product added to your cart. Log in to place an order."
    end
  end

  def destroy
    if user_signed_in?
      @cart_item = current_user.carts.find(params[:id])
      @cart_item.destroy
      redirect_to carts_path, notice: 'Item removed from your cart.'
    else
      # Remove cart item from session for unauthenticated users
      Rails.logger.debug "Session Cart Before: #{session[:cart].inspect}"
      Rails.logger.debug "Params: #{params.inspect}"

      session[:cart] ||= []
      session[:cart].reject! { |item| item['product_id'] == params[:product_id].to_s }
      redirect_to carts_path, notice: 'Item removed from your cart!'
    end
  end

  def remove_item
    session[:cart] ||= []
    session[:cart].reject! { |item| item['product_id'] == params[:product_id] }
    redirect_to carts_path, notice: 'Item removed from your cart.'
  end
  
end

