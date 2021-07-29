class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])

      # ユーザー登録中にログインを済ませておく
      login(@user)
      flash[:success] = "Yay, You're Logged In Now!!"

      redirect_to root_url
    else
      flash.now[:danger] = "Ooops, Invalid Credentials..."

      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    logout(@user)

    flash[:info] = "Logged Out!! See You Again!!"
    redirect_to root_url
  end
end
