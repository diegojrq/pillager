class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :description
      t.boolean :pending
      t.references :user
      t.references :community
      
      t.timestamps
    end
  end
end
