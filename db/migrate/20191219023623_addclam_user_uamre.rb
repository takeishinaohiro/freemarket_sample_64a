class AddclamUserUamre < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :real_name_read, :string
    add_column :users, :last_name_read, :string
    add_column :users, :birthday, :string
  end
end
