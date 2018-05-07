class AddBuyerToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :buyer, :string
  end
end
