class LoginController < ApplicationController
	def index

	end

	def new

	end

	def create
		render plain: params[:suburb].inspect
	end
end
