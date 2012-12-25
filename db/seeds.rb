### Creating Users

User.delete_all
User.create!(:name => "Diego Queiroz", :password => "123",
  :password_confirmation => "123", :email => "diegojrq@gmail.com", :role_id => 1)
User.create!(:name => "Ana Paula", :password => "123",  
  :password_confirmation => "123", :email => "anap.aguiarc@gmail.com", :role_id => 2)

#@ create! serve pra pocar o erro pelo q eu testei (erro de duplicacao de email nesse caso)

### Creating Users