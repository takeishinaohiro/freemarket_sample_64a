class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
    change_column :users, :meta, :text
  end
end
