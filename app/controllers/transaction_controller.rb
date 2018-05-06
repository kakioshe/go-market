class TransactionController < ApplicationController

	def checkout

  		@order = current_order
		
		if (@payment = new_paypal).error.nil?
  			@order.update!(payment_no: @payment.id)
      		@redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
      		redirect_to @redirect_url

      	else
      		@message = @payment.error
      	end

	end

	def finish
		@order = current_order
		@order.order_items.each do |order|
			@buyer = current_user.firstName + " " + current_user.lastName
			@transaction = Transaction.new(status: "Paid", quantity: order.quantity, products_id: order.product_id, users_id: @order.user_id, stores_id: order.product.stores_id, title: order.product.title, buyer: @buyer, order_id: @order.id)
			@transaction.save
			order.update!(status: "Paid")
		end
		@order.update!(order_status_id: 2)
		session.delete(:order_id)
		redirect_to root_url
	end


	private
		def new_paypal
			PaypalApi.new({
				transaction: @order.order_items,
			    return_url: transactions_execute_url,
			    cancel_url: root_url,
			    price: @order.subtotal
				}).create_payment
		end
end
