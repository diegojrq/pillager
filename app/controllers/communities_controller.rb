class CommunitiesController < ApplicationController
  def index
    @communities = Community.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @communities }
    end
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @community = Community.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @community }
    end
  end
  
  def new
    @community = Community.new
  end
  
  def create
    @community = Community.new(params[:community])
    @community.owner_id = current_user.id

    if @community.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  # GET /communities/1/edit
  def edit
    @community = Community.find(params[:id])
  end
  
  # PUT /communities/1
  # PUT /communities/1.json
  def update
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update_attributes(params[:community])
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    respond_to do |format|
      format.html { redirect_to communities_url }
      format.json { head :no_content }
    end
  end
  
end
