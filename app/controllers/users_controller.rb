class UsersController < ApplicationController  

  before_filter :require_admin, :only => [:index]
  before_filter :validate_url_hack, :only => [:edit, :show, :update, :destroy]
  skip_before_filter :require_login, :only => [:create, :new]

  private

  def validate_url_hack
    puts "heraiem"
    puts params[:id]
    puts params[:id].to_i
    puts current_user.id
    puts current_user.is_an_admin?
    puts (params[:id] == current_user.id)
    
    if not current_user.is_an_admin?
      if not params[:id].to_i == current_user.id
        flash[:error] = "Nonono my friend. Not this way."
        redirect_to log_in_url
      end
    end
  end

  public

  def index    
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
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
    @user.role_id = 2 # simple user
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
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
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def associate_role
    @users = User.all
    @roles = Role.all
  end
  
end
