class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id]) # Finds the product by its ID
  end

  def new
    @product = Product.new
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    puts "DELETE request received for product: #{@product.id}"
  
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Product was successfully deleted.' }
      format.js   # Optional, if you are using AJAX for deletion
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image_url)
  end

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
  end
end
