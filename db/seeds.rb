Role.delete_all
admin_role = Role.create!(:name => "admin", :description => "Administrator")
user_role = Role.create!(:name => "user", :description => "User")

User.delete_all
u1 = User.new(:first_name => "Diego", :last_name => "Queiroz", :password => "123",
  :password_confirmation => "123", :email => "diegojrq@gmail.com", :birthday => "1987-10-28",
  :gender => "M")
u1.role = admin_role
u1.save!

u2 = User.new(:first_name => "Ana Paula", :last_name => "Aguiar", :password => "123",  
  :password_confirmation => "123", :email => "anap.aguiarc@gmail.com", :birthday => "1989-04-15",
  :gender => "F")
u2.role = user_role
u2.save!

Community.delete_all
c = Community.create!(:name => "Community Alpha", :owner_id => 1)
c.users << u1
c = Community.create!(:name => "Community Beta", :owner_id => 1)
c.users << u1
c = Community.create!(:name => "Community Gama", :owner_id => 2)
c.users << u2
c.users << u1