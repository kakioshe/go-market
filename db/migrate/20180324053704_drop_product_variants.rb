class DropProductVariants < ActiveRecord::Migration[5.1]
  def change
  	drop_table :product_variants
  end
end
