class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :status
      t.integer :quantity

      t.timestamps
    end
  end
end
