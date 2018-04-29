class ProductsController < ApplicationController

  def index
    @product = if params[:term]
      Product.where('title LIKE ?', "%#{params[:term]}%")
    else
      @product = Product.all
    end
  end

  def new
    @product = Product.new
    3.times { @product.pictures.build }
    @category = Category.all
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

  def edit
    @product = Product.find(params[:id])
    pic = []
    for picture in @product.pictures
      pic << picture
    end

    iteration = 3-pic.count
    i = 0
    while i < iteration
      @product.pictures.build
      i+=1
    end
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to "/catalogue", :notice => "Successfully destroyed product."
  end

  def showcategory
    @category = Category.find(params[:id])
    @product = Product.all
    @prod_cat = []
    for product in @product
      if product["categories_id"].to_s == params[:id].to_s
        @prod_cat << product
      end
    end
  end


  private

  def product_param
    params.require(:product).permit(:title, :description, :availability, :price, :categories_id, pictures_attributes: [:product_id, :id, :image])
  end
end
