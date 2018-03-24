class AddStoresToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :stores, foreign_key: true
  end
end
