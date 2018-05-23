class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@transactions = Order.where(:user_id => @user.id).all
		@name = @user.firstName+" "+@user.lastName
		if @user.address1 != nil && @user.address1 != ""
			@flag = true
			@email = @user.email
			@phone = @user.phone
			@storeid = @user.stores_id
			if @user.address2 != nil && @user.address2 != ""
				@address = @user.address1+", "+@user.address2+", "+@user.suburb+", "+@user.city+", "+@user.state
			else
				@address = @user.address1+", "+@user.suburb+", "+@user.city+", "+@user.state
			end
		else
			@flag = false
		end



	end

	def history
		@user = User.find(current_user.id)
		@transactions = Order.where(:user_id => @user.id).where("order_status_id > ?",1).all.order('id DESC')
	end


	def execute
		@order = Order.find(params[:order_id])
		@item = @order.order_items.find_by(product_id: params[:product])
		@transaction = Transaction.find_by(order_id: params[:order_id])

		@item.update!(status: "Finished")
		@transaction.update!(status: "Finished")
		redirect_to user_history_path

	end


	def receipt
		@invoice = Order.find(params[:order_id])
		@user = User.find(@invoice.user_id)
		respond_to do |format|
	      format.pdf do
	        render pdf: "invoice",
	               template: "users/receipt.pdf.erb",
	               locals: {:invoice => @invoice, :user => @user}
	      end
	    end
	end

end
