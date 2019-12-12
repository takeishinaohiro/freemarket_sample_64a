class AddnicknameTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :k_name,   :string, null: false
    add_column :users, :birthday, :string, null: false
    add_column :users, :add_name,     :string, null: false
    add_column :users, :add_k_name,   :string, null: false
    add_column :users, :postal_code,  :string, null: false
    add_column :users, :prefucture,   :string, null: false
    add_column :users, :city,         :string, null: false
    add_column :users, :city_address, :string, null: false
    add_column :users, :building,     :string, null: true
    add_column :users, :phone_number, :string, null: true
  end
end
