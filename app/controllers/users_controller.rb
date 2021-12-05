class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "サインインに成功しました！"


      redirect_to new_session_url
    else
      flash[:error] = "サインインできませんでした。情報をご確認のうえ、もう一度お試しください。"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render "show"
    else
      render "edit"
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture, :uni, :year, :description, :is_admin)
  end
end