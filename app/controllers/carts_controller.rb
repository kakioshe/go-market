class CartsController < ApplicationController
  def show
    @items = current_order.order_items
    @user = User.find(current_user.id)

	if @user.address1 != nil && @user.address1 != ""
		@flag = true
	else
		@flag = false
	end
  end

  def checkout
  	@items = current_order.order_items
  	@items.update
  	render root
  end
end
