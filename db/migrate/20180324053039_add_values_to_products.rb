class AddValuesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :picture, :text
    add_column :products, :maps, :text
    add_reference :products, :stores, foreign_key: true    
    add_reference :products, :categories, foreign_key: true
  end
end
