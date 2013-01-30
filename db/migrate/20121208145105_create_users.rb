class CreateUsers < ActiveRecord::Migration
  def change    
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.string :password_hash
      t.string :password_salt      
      t.string :gender, :limit => 1
      
      t.references :role

      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
end
