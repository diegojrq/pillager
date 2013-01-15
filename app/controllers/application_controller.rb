class ApplicationController < ActionController::Base

  protect_from_forgery  
  helper_method :current_user  
  before_filter :require_login

  private

  def require_login
    if not current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
  
  def require_admin
    if not current_user.is_an_admin?
      flash[:error] = "Nah, u can't. U're just a simple " + current_user.role.name + ". Sorry!"
      redirect_to home_path
    end
  end
  
  def validate_path_hack
      if not params[:id].to_i == current_user.id
        flash[:error] = "Nonono my friend. Not this way."
        redirect_to home_path
      end
  end
  
  public

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
end
