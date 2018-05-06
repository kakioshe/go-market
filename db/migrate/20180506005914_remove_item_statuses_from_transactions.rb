class RemoveItemStatusesFromTransactions < ActiveRecord::Migration[5.1]
  def change
  	remove_column :transactions, :item_statuses_id
  end
end
