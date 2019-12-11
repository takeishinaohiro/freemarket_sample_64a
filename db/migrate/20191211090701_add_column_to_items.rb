class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :burden, :string, null: false
    add_column :items, :area, :string, null: false
    add_column :items, :days, :string, null: false
  end
end
