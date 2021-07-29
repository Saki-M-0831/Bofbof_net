class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])

      # ユーザー登録中にログインを済ませておく
      login(@user)
      flash[:success] = "ログインに成功しました！"

      redirect_to root_url
    else
      flash.now[:danger] = "入力した情報に誤りがあります"

      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    logout(@user)

    flash[:info] = "ログアウトしました！またね！"
    redirect_to root_url
  end
end
