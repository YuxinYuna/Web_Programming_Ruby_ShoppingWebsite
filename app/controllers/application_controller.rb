class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  # Permit the admin parameter during sign-up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
  end

  # Handle redirection after sign-in
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      merge_cart # Call cart merging logic for regular users
      root_path # Redirect to the shopping homepage
    end
  end

  # Redirect to login page after logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
  end

  # Merge session cart into the database cart for logged-in users
  def merge_cart
    return unless session[:cart].present? && user_signed_in?

    session[:cart].each do |item|
      cart_item = current_user.carts.find_or_initialize_by(product_id: item['product_id'])
      cart_item.quantity += item['quantity'].to_i
      cart_item.save
    end

    session.delete(:cart) # Clear session cart after merging
  end
end
