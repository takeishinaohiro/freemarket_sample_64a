class ChangeItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :buyers, :items_id
  end
  def change
    add_column :buyers, :item_id,:string
  end
end
