class UsersController < ApplicationController

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
		
end
