class LikesController < ApplicationController
  
  def create
    @story = Story.find(params[:story_id])
    unless @story.like?(current_user)
      @story.like(current_user)
      @story.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || story_path(@story) }
        format.js
      end
    end
  end

  def destroy
    @story = Like.find(params[:id]).story
    if @story.like?(current_user)
      @story.unlike(current_user)
      @story.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || story_path(@story) }
        format.js
      end
    end
  end
end
