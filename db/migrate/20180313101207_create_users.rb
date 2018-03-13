class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstName
      t.string :lastName
      t.string :email
      t.text :address1
      t.text :address2
      t.string :suburb
      t.string :state
      t.string :country
      t.string :phone
      t.text :picture

      t.timestamps
    end
  end
end
