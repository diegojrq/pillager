class AdminController < ApplicationController
  
  layout "admin_application"

  skip_before_filter :require_login  
  before_filter :require_admin
  
  def index
  end
  
end
