class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :plice
      t.text    :image
      t.text    :text
      t.timestamps
    end
  end
end