class AddStoresToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :stores, foreign_key: true
  end
end
