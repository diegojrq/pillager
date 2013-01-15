### Creating Users

User.delete_all
u1 = User.create!(:name => "Diego Queiroz", :password => "123",
  :password_confirmation => "123", :email => "diegojrq@gmail.com", :role_id => 1)
u2 = User.create!(:name => "Ana Paula", :password => "123",  
  :password_confirmation => "123", :email => "anap.aguiarc@gmail.com", :role_id => 2)

#@ create! serve pra pocar o erro pelo q eu testei (erro de duplicacao de email nesse caso)

### Creating Roles

Role.delete_all
Role.create!(:name => "admin", :description => "Administrator.")
Role.create!(:name => "user", :description => "Simple user.")

### Creating communities

Community.delete_all
c = Community.create!(:name => "Community Alpha", :owner_id => 1)
c.users << u1
c = Community.create!(:name => "Community Beta", :owner_id => 1)
c.users << u1
c = Community.create!(:name => "Community Gama", :owner_id => 2)
c.users << u2
c.users << u1

/
# deleting
User.delete_all
Role.delete_all
Community.delete_all

# creating
## creating admin role
r = Role.create!(:name => "admin", :description => "Administrator.")
## creating user
u = User.create!(:name => "Diego Queiroz", :password => "123",
  :password_confirmation => "123", :email => "diegojrq@gmail.com")
## setting user to admin
u.role = r
c = Community.create!(:name => "Community Alpha", :owner_id => 1)
## adding user to community
c.users << u
c = Community.create!(:name => "Community Beta", :owner_id => 1)
c.users << u
## creating normal user
u = User.create!(:name => "Ana Paula", :password => "123",  
  :password_confirmation => "123", :email => "anap.aguiarc@gmail.com")
r = Role.create!(:name => "user", :description => "Simple user.")
u.role = r
c = Community.create!(:name => "Community Gama", :owner_id => 2)  
c.users << u
/