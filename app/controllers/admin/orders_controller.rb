class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: 'Order updated successfully.'
    else
      render :edit, alert: 'Failed to update order.'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path, notice: 'Order deleted successfully.'
  end

  private

  def order_params
    params.require(:order).permit(:status, :user_id, :total_price) # Adjust based on your Order schema
  end

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
  end
end
