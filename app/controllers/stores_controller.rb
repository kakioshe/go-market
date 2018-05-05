class StoresController < ApplicationController

	def new 
	end

	def create
		@stores = Store.new(stores_params)
		if @stores.save
			User.update(current_user.id, :stores_id => @stores.id)
			redirect_to root_path
		end

	end


	def show
		@store = Store.find(params[:id])
		@store_products = Product.active.where(stores_id: @store.id).all
		@store_inactive = Product.inactive.where(stores_id: @store.id).all
	end


	def edit
    	@stores = Store.find_by(id:current_user.stores_id)
	end

	def update
    	@stores = Store.find_by(id:current_user.stores_id)
    	if @stores.update(store_params)
    		redirect_to @stores
    	end
	end

	def history
		@store = Store.find(current_user.stores_id)
		@transaction = Transaction.where(stores_id: current_user.stores_id).all
	end

	private

		def stores_params
			params.require(:stores).permit(:name, :description)
		end

end
