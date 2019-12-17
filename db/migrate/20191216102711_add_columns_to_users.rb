class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
    change new_user_registration_path_column :users, :meta, :text
  end
end
