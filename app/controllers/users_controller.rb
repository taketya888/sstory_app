class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page])
    @count = @q.result(distinct: true).count
  end

  def show
    @user = User.find_by(id: params[:id])
    @stories = @user.stories.paginate(page: params[:page]).where(status: true).order(created_at: :desc)
    @likes = Like.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認してアカウント登録を完了させてください"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザーの作成に失敗しました。"
      render "new"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "変更を保存しました"
      redirect_to @user
    else
      flash.now[:dager] = "変更の保存に失敗しました"
      render "edit"
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :image)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
