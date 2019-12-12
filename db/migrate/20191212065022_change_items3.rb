class ChangeItems3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :buyers, :items_id
    remove_column :sellers , :items_id
    add_column :sellers, :item_id,:string
    add_column :buyers, :item_id,:string
  end
end
