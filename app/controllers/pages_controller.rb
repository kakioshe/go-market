class PagesController < ApplicationController
  before_action :force_json, only: :search
  def index
    @product = Product.active.find(:all, :order => "id desc", :limit => 10)
    @store = Store.all
  end

  def search
    @products = Product.ransack(title_cont: params[:q]).result(distinct: true).limit(3)
    @categories = Category.ransack(title_cont: params[:q]).result(distinct: true).limit(3)
  end

 def not_found
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end

  private
  def force_json
    request.format = :json
  end
end
