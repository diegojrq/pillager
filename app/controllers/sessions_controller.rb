class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:create, :new]
  
  def new
    if current_user
      redirect_to home_path, :notice => "Already Logged in dumb one!"
    end
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user[:id]
      redirect_to home_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged out!"
  end
end
