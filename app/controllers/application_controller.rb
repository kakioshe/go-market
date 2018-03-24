class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :phone, :address1, :address2, :suburb, :city, :state, :zip])
		devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :phone, :address1, :address2, :suburb, :city, :state, :zip])
	end
end
