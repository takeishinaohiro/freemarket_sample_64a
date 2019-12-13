class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text    :description, null: false
      t.integer :price, null: false
      t.string  :category, null: false
      t.string  :status, null: false
      t.string  :burden, null: false
      t.string  :area, null: false
      t.string  :days, null: false
      t.timestamps
    end
  end
end