class CreateCommunities < ActiveRecord::Migration
  def up
    create_table :communities do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end
  end
  
  def down
    drop_table :communities
  end
end
