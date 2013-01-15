class InvitesController < ApplicationController
  
  def index
    if current_user.is_an_admin?
      @invites = Invite.all
    else
#      @invites = Invite.where("owner_id = ?", current_user[:id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invites }
    end
  end
  
  def create
    @invite = Invite.new
    @invite.user = User.find(params[:user])
    @invite.community = Community.find(params[:community])
    
    if @invite.save
      redirect_to @invite.community, :notice => @invite.user.name + " invited! Ask him to accept."
    else
      render "new"
    end
  end
  
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to invites_path }
      format.json { head :no_content }
    end
  end
  
end
