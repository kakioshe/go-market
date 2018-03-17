class Product < ApplicationRecord

  validate: title, presence: true

  has_many: product_categories
  has_many: categories, through: product_categories
end
