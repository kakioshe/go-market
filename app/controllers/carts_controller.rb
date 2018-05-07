class CartsController < ApplicationController
  def show
    @items = current_order.order_items
  end

  def checkout
  	@items = current_order.order_items
  	@items.update
  	render root
  end
end
