class Product < ApplicationRecord
  has_many :product_categories
  has_many :order_items
  has_many :categories, through: :product_categories
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  
  validates :title, presence: true

end
