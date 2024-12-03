class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @products = Product.all
  end

  def show
    def show
      @product = Product.find(params[:id]) # Finds the product by its ID
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image_url)
  end
end
