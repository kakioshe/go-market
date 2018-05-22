class MapsController < ApplicationController
  def index
    @product = Product.active.all
  end
end
