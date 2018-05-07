class AddTitleToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :title, :string
  end
end
