class StoresController < ApplicationController

	def new
		if current_user.stores_id?
			redirect_to store_path(current_user.stores_id)
		end
	end

	def create
		@stores = Store.new(add_store_params)
		if @stores.save
			User.update(current_user.id, :stores_id => @stores.id)
			redirect_to root_path
		end

	end


	def show
		@store = Store.find(params[:id])
		@store_products = Product.active.where(stores_id: @store.id).all
		@store_inactive = Product.inactive.where(stores_id: @store.id).all

		@categories = Category.all
		@categoryDict = {'Furniture'=>0, 'Fashion'=>0, 'Office & Stationary'=>0, 'Foods & Drinks'=>0, 'Kitchen Tools'=>0, 'Tools'=>0, 'Automative'=>0, 'Hobby'=>0}

		for i in 0..(@categoryDict.count-1)
			title = @categories.find(i+1).title
			@categoryDict[title] = @store_products.where(categories_id: i+1).count
		end
	end


	def edit
    	@stores = Store.find_by(id:current_user.stores_id)
	end

	def update
    	@stores = Store.find_by(id:current_user.stores_id)
    	if @stores.update(stores_params)
    		redirect_to @stores
    	end
	end

	def history
		@store = Store.find(current_user.stores_id)
		@transaction = Transaction.where(stores_id: current_user.stores_id).all.order('id DESC')
		@month = []
		@monthDict = {1 =>'January', 2 =>'February', 3 =>'March', 4 =>'April', 5 =>'May', 6 =>'June', 7 =>'July', 8 =>'August', 9 =>'September', 10 =>'October', 11 =>'November', 12 =>'December'}
		for i in 0..12
			@month << @transaction.where('extract(month from created_at) = ?', i+1)
		end
	end

	def execute
		@order = Order.find(params[:order_id])
		@item = @order.order_items.find_by(product_id: params[:product])
		@transaction = Transaction.find_by(order_id: params[:order_id])

		@item.update!(status: "Shipped")
		@transaction.update!(status: "Shipped")
		redirect_to store_history_path

	end

	private

		def stores_params
			params.require(:store).permit(:name, :description, :avatar)
		end

		def add_store_params
			params.require(:stores).permit(:name, :description, :avatar)
		end

end
