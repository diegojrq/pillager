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
      if current_user.is_an_admin?
        if not is_admin_path
          flash[:error] = "Not this way, bro. Try the #{ActionController::Base.helpers.link_to "Admin Interface", '/admin'}".html_safe + "!"
          redirect_to home_path
        end
      else
        flash[:error] = "Nah, friend. U can`t."
        redirect_to home_path
      end
    end    
  end
  
  def current_controller
    current_uri = request.env['ORIGINAL_FULLPATH']
    @controller = (Rails.application.routes.recognize_path current_uri)[:controller]
  end
  
  def current_action
    current_uri = request.env['ORIGINAL_FULLPATH']
    @action = (Rails.application.routes.recognize_path current_uri)[:action]
  end
  
  public

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def is_admin_path
    return true if current_controller.split("/").first == "admin"
  end
    
end
