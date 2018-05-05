class PaypalApi
	def initialize(params)
		@transaction = params[:transaction]
		@return_url = params[:return_url]
		@cancel_url = params[:cancel_url]
		@price = params[:price]
		@currency = "AUD"
	end

	def create_payment
		payment= PayPal::SDK::REST::Payment.new({
			intent: "sale",
			payer: { payment_method: "paypal" },
			redirect_urls: { return_url: @return_url, cancel_url: @cancel_url },
			transactions: [{ item_list: { items: get_items },
				amount: { total: ActionController::Base.helpers.number_with_precision(@price, precision: 2),
					currency: @currency}
			}]
		})
		payment.create
		payment
	end


	private
	def get_items
		list = []
		@transaction.each do |item|
			list << { name: item.product.title, price: item.unit_price, currency: "AUD", quantity: item.quantity.to_i }
		end
		list
	end
end