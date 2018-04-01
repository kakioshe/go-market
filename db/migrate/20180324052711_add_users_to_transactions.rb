class AddUsersToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :users, foreign_key: true
  end
end
