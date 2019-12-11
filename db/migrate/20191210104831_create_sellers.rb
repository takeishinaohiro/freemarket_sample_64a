class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|

      t.timestamps
      t.string :items_id
      t.string :user_id
      
    end
  end
end
