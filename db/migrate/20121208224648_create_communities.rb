class CreateCommunities < ActiveRecord::Migration
  def up    
    create_table :communities do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
