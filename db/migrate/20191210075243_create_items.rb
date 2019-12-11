class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text    :description, null: false
      t.integer :price, null: false
      t.timestamps
      t.string  :user_id
    end
  end
end