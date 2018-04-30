class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :order_exist
  validate :product_exist

  before_save :update_all

  def unit_price
  	product.price
  end


  private
  def product_exist
  	if product.nil?
  		errors.add(:product,"is not valid")
  	end
  end

  def order_exist
  	if order.nil?
  		errors.add(:order, "is not valid")
  	end
  end

  def update_all
  	self[:unit_price] = unit_price
  	self[:total_price] = quantity * self[:unit_price]
  end
end
