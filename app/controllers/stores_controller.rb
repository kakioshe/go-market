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
		@store_products = Product.where(stores_id: @store.id).all
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

	private

		def stores_params
			params.require(:stores).permit(:name, :description)
		end

		def store_params
			params.require(:store).permit(:name, :description)
		end

end
