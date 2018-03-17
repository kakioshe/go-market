class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_param)
    if @product.save
      redirect_to new_products_path
    end
  end

  private

  def product_param
    params.require(:product).permit(:title, :description, :availability, :price)
  end
end
