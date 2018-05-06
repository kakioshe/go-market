class RemoveItemStatusesIdFromOrderItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_items, :item_statuses_id
  end
end
