class Product < ApplicationRecord
  has_many :product_categories
  has_many :order_items
  has_many :categories, through: :product_categories
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  default_scope { where(active: true) }
  
  validates :title, presence: true

end
