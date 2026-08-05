class ProductsController < ApplicationController

  def show
    @product = Product.find_by!(slug: params[:id])
  end

  def index
    @products = Product.order(:name)
  end

end
