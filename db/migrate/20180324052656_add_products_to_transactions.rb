class AddProductsToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :products, foreign_key: true
  end
end
