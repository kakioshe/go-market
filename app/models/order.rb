class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_create :set
  before_save :update

  def subtotal
  	order_items.collect {|items| items.valid ? 	(items.quantity * items.unit_price) : 0 }.sum
  end

  private
  def set
  	self.order_status_id = 1
  end

  def update
  	self[:subtotal] = subtotal
  end
end
