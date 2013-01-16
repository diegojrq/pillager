class ApplicationController < ActionController::Base

  protect_from_forgery  
  helper_method :current_user, :is_admin_path
  before_filter :require_login, :session_update

  private

  def session_update
    session[:return_to] ||= request.referer
  end

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
  
  def is_admin_path
    current_uri = request.env['ORIGINAL_FULLPATH']
    path = Rails.application.routes.recognize_path current_uri
    puts path
    controller = path[:controller]
    action = path[:action]
    puts "moreoverth"

    if controller == "admin"
      return true
    else
      return false
end
  end
    
end
