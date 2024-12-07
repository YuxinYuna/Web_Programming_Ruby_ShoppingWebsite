require "ostruct"

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
      # Store cart item in the database for logged-in users
      @cart = current_user.carts.find_or_initialize_by(product_id: params[:product_id])
      @cart.quantity += params[:quantity].to_i
      if @cart.save
        flash[:notice] = "Product added to your cart."
      else
        flash[:alert] = "Unable to add product to your cart."
      end
    else
      # Store cart item in session for non-logged-in users
      session[:cart] ||= []
      product_id = params[:product_id].to_s
      existing_item = session[:cart].find { |item| item["product_id"] == product_id }
      if existing_item
        existing_item["quantity"] += params[:quantity].to_i
      else
        session[:cart] << { "product_id" => product_id, "quantity" => params[:quantity].to_i }
      end
      flash[:notice] = "Product added to your cart. Log in to place an order."
    end
    redirect_to products_path
  end

  def destroy
    if user_signed_in?
      @cart_item = current_user.carts.find(params[:id])
      @cart_item.destroy
      redirect_to carts_path, notice: "Item removed from your cart."
    else
      # Remove cart item from session for unauthenticated users
      Rails.logger.debug "Session Cart Before: #{session[:cart].inspect}"
      Rails.logger.debug "Params: #{params.inspect}"

      session[:cart] ||= []
      session[:cart].reject! { |item| item["product_id"] == params[:product_id].to_s }
      redirect_to carts_path, notice: "Item removed from your cart!"
    end
  end

  def remove_item
    session[:cart] ||= []
    session[:cart].reject! { |item| item["product_id"] == params[:product_id] }
    redirect_to carts_path, notice: "Item removed from your cart."
  end
end
