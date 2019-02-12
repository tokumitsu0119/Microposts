class LikesController < ApplicationController
  before_action :require_user_logged_in


  def index
    @likes = Like.all.page(params[:page])
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.iine?(current_user)
      @micropost.iine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
  
  
  def destroy
    @micropost = Like.find(params[:id]).micropost
    if @micropost.iine?(current_user)
      @micropost.uniine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
