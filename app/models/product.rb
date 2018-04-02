class Product < ApplicationRecord

  validates :title, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :pictures
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
