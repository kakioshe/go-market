class AddOrderIdToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :order, foreign_key: true
  end
end
