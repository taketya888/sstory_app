class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    if params[:category_id]
      @selected_category = Category.find(params[:category_id])
      @counts = Story.where(status: true).from_category(params[:category_id]).count
      @stories = Story.from_category(params[:category_id]).paginate(page: params[:page]).order(created_at: :desc)
    else
      @q = Story.ransack(params[:q])
      @counts = @q.result(distinct: true).count
      if params[:sort] == "1" || params[:sort] == nil
        @stories = @q.result(distinct: true).paginate(page: params[:page]).order(created_at: :desc)
      elsif params[:sort] == "2"
        @stories = @q.result(distinct: true).paginate(page: params[:page]).order(:created_at)
      elsif params[:sort] == "3"
        @stories = @q.result(distinct: true).paginate(page: params[:page]).order(likes_count: :desc)
      end
    end
  end

  def show
    @story = Story.find_by(id: params[:id])
    @tags = @story.categories.map(&:name)
    if @story.status == false
      redirect_to stories_path
      flash[:danger] = "表示するデータがありません"
    end
  end

  def new
    @user = User.new
    @story = @user.stories.build
  end

  def edit
    @story = Story.find_by(id: params[:id])
    @category_list = @story.categories.pluck(:name).join(",")
  end

  def create
    @story = current_user.stories.build(story_params)
    if params[:category_list]
      category_list = params[:category_list].split(",")
    end
    if @story.save
      @story.save_categories(category_list)
      flash[:success] = "保存しました"
      redirect_to story_path(@story)
    else
      render "new"
    end
  end

  def update
    @story = Story.find_by(id: params[:id])
    category_list = params[:category_list].split(",")
    if @story.update_attributes(story_params)
      @story.save_categories(category_list)
      flash[:success] = "変更を保存しました"
      redirect_to @story
    else
      flash.now[:dager] = "変更の保存に失敗しました"
      render "edit"
    end
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @user = User.find_by(id: @story.user_id)
    @story.update(status: false)
    @story.story_categories.each do |story_category|
      story_category.category.update(status: false)
    end
    flash[:success] = "削除しました"
    redirect_to user_path(@user)
  end

  def likes
    @user = User.find_by(id: current_user.id)
    @likes = Like.where(user_id: @user.id)
  end
  
  private

  def story_params
    params.require(:story).permit(:title, :start_text,
                                  :consent_text, :terning_text, :finish_text)
  end
end
