class ProductsController < ApplicationController
  def new
    @product = Product.new
    3.times { @product.pictures.build }
  end

  def create
    @product = Product.new(product_param)
        if @product.save
          redirect_to @product, :notice => "Successfully created product."
        else
          render :action => 'new'
        end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def edit
  end

  private

  def product_param
    params.require(:product).permit(:title, :description, :availability, :price, pictures_attributes: [:image])
  end
end
