class CreateCommunities < ActiveRecord::Migration
  def up
    create_table :communities do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
  
  def down
    drop_table :communities
  end
end
