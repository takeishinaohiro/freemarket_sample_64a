class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|

      t.timestamps
      t.string :items_id
      t.string :user_id
    end
  end
end
