class LikesController < ApplicationController
  before_action :set_variables

  def like
    @like = current_user.likes.build(story_id: @story.id)
    @like.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def unlike
    @like = Like.find_by(story_id: @story.id,user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_variables
    @story = Story.find_by(id: params[:story_id])
    @id_name = "#like-link-#{@story.id}"
  end
end