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
    @pictureslink = []
    for picture in @product.pictures
      @pictureslink << picture.image.url
    end
  end

  def index
    @product = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    puts @product.price.to_i
    if @product.update(product_param)
      redirect_to @product, :notice  => "Successfully updated product."
    else
      Rails.logger.info(@product.price)
      Rails.logger.info(@product.errors.messages.inspect)
      render :action => 'edit'
    end
  end

  private

  def product_param
    params.require(:product).permit(:title, :description, :availability, :price, pictures_attributes: [:product_id, :id, :image])
  end
end
