class StoriesController < ApplicationController
    before_action :logged_in_user, only:[:create, :destroy]
    
    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            flash[:success] = "保存しました"
            redirect_to root_url
        else
         render "new"
        end
    end
    
    def destroy
    end
    
    def new
        @user = User.new
        @story = @user.stories.build
    end
    
    private
    
        def story_params
            params.require(:story).permit(:start_text,:consent_text,:terning_text,:finish_text)
        end
end
