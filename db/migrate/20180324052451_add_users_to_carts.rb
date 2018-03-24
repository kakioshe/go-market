class AddUsersToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :users, foreign_key: true
  end
end
