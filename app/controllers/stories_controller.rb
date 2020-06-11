class StoriesController < ApplicationController
    before_action :logged_in_user, only:[:create, :destroy]
    
    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            flash[:success] = "保存しました"
            redirect_to story_path(@story)
        else
         render "new"
        end
    end
    
    def destroy
       @story = Story.find_by(params[:id])
       @user = User.find_by(id: @story.user_id)
       @story.destroy
       flash[:success] = "削除しました"
       redirect_to user_path(@user)
    end
    
    def new
        @user = User.new
        @story = @user.stories.build
    end
    
    def show
     @story = Story.find(params[:id])
    end
    
    def index
        @stories = Story.all.order(created_at: :desc)
    end
    
    def edit
        @story = Story.find(params[:id])
    end
    
    def update
    @story = Story.find(params[:id])
     if @story.update_attributes(story_params)
      flash[:success] = "変更を保存しました"
      redirect_to @story
     else
      flash.now[:dager] = "変更の保存に失敗しました"
      render "edit"
     end
    end
    
    private
    
        def story_params
            params.require(:story).permit(:title,:start_text,:consent_text,:terning_text,:finish_text)
        end
end