class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :plice
      t.text    :image
      t.text    :text
      t.timestamps
      t.string  :user_id
    end
  end
end