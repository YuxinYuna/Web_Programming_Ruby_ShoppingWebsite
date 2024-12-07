class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @products = Product.all
  end

  private

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
  end
end
