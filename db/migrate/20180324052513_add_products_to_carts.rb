class AddProductsToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :products, foreign_key: true
  end
end
