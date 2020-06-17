class LikesController < ApplicationController
  
  def create
    @like = Like.new(user_id: current_user.id, story_id: params[:story_id])
    @like.save
    redirect_to story_path(params[:story_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, story_id: params[:story_id])
    @like.destroy
    redirect_to story_path(params[:story_id])
  end
    
  private
  
  def set_variables
    @story = Story.find(params[:story_id])
    @id_name = "#like-link-#{@story.id}"
  end
  
end