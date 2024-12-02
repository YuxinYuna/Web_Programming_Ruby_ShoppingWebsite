class ApplicationController < ActionController::Base
  before_action :merge_cart_after_login

  private

  def merge_cart_after_login
    return unless user_signed_in? && session[:cart].present?

    session[:cart].each do |item|
      cart_item = current_user.carts.find_or_initialize_by(product_id: item['product_id'])
      cart_item.quantity += item['quantity'].to_i
      cart_item.save
    end

    session.delete(:cart) # Clear session cart after merging
  end
end

