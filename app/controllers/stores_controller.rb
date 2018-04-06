class StoresController < ApplicationController

	def new 
	end

	def create
		@stores = Store.new(store_params)
		if @stores.save
			User.update(current_user.id, :stores_id => @stores.id)
			redirect_to root_path
		end

	end

	private

		def store_params
			params.require(:stores).permit(:name, :description)
		end

end
