class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column    :users, :token, :string
    change_column :users, :meta,  :text
  end

  def down
    remove_column :users, :token, :string
    change_column :users, :meta,  :string
  end
end
