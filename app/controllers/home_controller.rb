class HomeController < ApplicationController
  
  skip_before_filter :require_login
  
  def home
  end

  def main
    if not current_user
      redirect_to root_path
    end
  end
  
end
