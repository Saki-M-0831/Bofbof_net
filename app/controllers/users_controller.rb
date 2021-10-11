class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Yay, You're SignIn Now!!"
      redirect_to root_url
    else
      flash[:danger] = "Ooops"
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