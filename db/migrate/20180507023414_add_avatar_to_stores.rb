class AddAvatarToStores < ActiveRecord::Migration[5.1]
  def up
    add_attachment :stores, :avatar
  end
 
  def down
    remove_attachment :stores, :avatar
  end
end
