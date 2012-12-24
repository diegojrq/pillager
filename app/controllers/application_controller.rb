class ApplicationController < ActionController::Base

  protect_from_forgery  
  helper_method :current_user  
  before_filter :require_login

  private

  def require_login
    if not current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to log_in_url
    end
  end
  
  public

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
end
