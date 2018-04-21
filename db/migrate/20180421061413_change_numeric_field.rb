class ChangeNumericField < ActiveRecord::Migration[5.1]
def self.up
   change_column :order_items, :unit_price, :decimal, :precision => 15, :scale => 2
   change_column :order_items, :total_price, :decimal, :precision => 15, :scale => 2
   change_column :orders, :subtotal, :decimal, :precision => 15, :scale => 2
   change_column :orders, :shipping, :decimal, :precision => 15, :scale => 2
   change_column :orders, :total, :decimal, :precision => 15, :scale => 2
  end
end
