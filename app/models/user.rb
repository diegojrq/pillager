class User < ActiveRecord::Base
  
  has_and_belongs_to_many :communities
  belongs_to :role
  has_many :invites
  
  has_secure_password
  
  attr_accessible :gender, :first_name, :last_name, :role_id, :email, :password, :password_confirmation, :birthday  
  validates_presence_of :gender, :birthday, :first_name, :last_name, :email, :password, :on => :create
  validates_uniqueness_of :email
  
  def method_missing(method_id, *args)
    if match = matches_dynamic_role_check?(method_id)
      tokenize_roles(match.captures.first).each do |check|
        return true if role.name.downcase == check
      end
      return false
    else
      super
    end
  end

  private

  def matches_dynamic_role_check?(method_id)
    /^is_an?_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end

  def tokenize_roles(string_to_split)
    string_to_split.split(/_or_/)
  end
  
end
