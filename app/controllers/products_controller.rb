class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    if params[:query].present?
      search_term = params[:query].downcase
      @products = Product.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", "%#{search_term}%", "%#{search_term}%")
    else
      @products = Product.all
    end
  end


  def show
    @product = Product.find(params[:id]) # Finds the product by its ID
  end
end
