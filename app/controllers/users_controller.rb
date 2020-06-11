class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @stories = @user.stories.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認してアカウント登録を完了させてください"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザーの作成に失敗しました。"
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to root_url
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "変更を保存しました"
      redirect_to @user
    else
      flash.now[:dager] = "変更の保存に失敗しました"
      render "edit"
    end
  end
  
  def index
    @users = User.all
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:profile)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
