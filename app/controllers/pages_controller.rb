class PagesController < ApplicationController
  def home
    @products = Product.featured.order(:name).first(6)
  end
end
