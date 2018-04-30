class OrderItemsController < ApplicationController
  def create
  	@order = current_order #Check session through application_controller
  	@order_item = @order.order_items.new(order_item_param)
    @order_exist = @order.order_items.where(product_id:params[:order_item][:product_id])
    if @order_exist.count >= 1
      @order_exist.last.update_column(:quantity, @order_exist.last.quantity + params[:order_item][:quantity].to_i)
    else
  	 @order.save
    end
  	session[:order_id] = @order.id
  end

  def update
  	@order = current_order #Check session through application_controller
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.update_attributes(order_item_param)
  	@order_items = @order.order_items
    redirect_to cart_url
  end

  def destroy
  	@order = current_order
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.destroy
  	@order_items = @order.order_items
    redirect_to cart_url
  end


  private 
  	def order_item_param
  		params.require(:order_item).permit(:quantity, :product_id)
    end
end
