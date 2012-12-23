class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end
  
  def create
    @community = Community.new(params[:community])

    if @community.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
end
