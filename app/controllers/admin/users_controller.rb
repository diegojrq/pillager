class Admin::UsersController < ApplicationController::AdminController

  before_filter :validate_path_hack, :only => [:edit, :show, :update, :destroy]
  skip_before_filter :require_login, :only => [:create, :new]
  
  # GET /users/1
  # GET /users/1.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
#    @user.role_id = 2 # simple user
puts "whatamodafoca"
    if @user.save
      redirect_to admin_users_path, :notice => "U created a nice user, sir!"
    else
      render "new"
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end
  
end
