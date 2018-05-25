class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	helper_method :current_order

  	before_action :configure_permitted_parameters, if: :devise_controller?

  	def current_order
  		if user_signed_in? and session[:order_id].nil?
  			Order.new
  		else
  			Order.find(session[:order_id])
  		end
  	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :phone, :address1, :address2, :suburb, :city, :state, :zip, :avatar, :avatar_cache])
		devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :phone, :address1, :address2, :suburb, :city, :state, :zip, :avatar])
	end

end
