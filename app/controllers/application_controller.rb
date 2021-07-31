class ApplicationController < ActionController::Base
  include SessionsHelper 

  def require_admin
    unless current_user.is_admin == true
      flash.now[:error] = "アクセス権限がありません"

      redirect_to root_url
    end
  end

  def require_login
    unless logged_in?
      flash.now[:error] = "ログインしてください"

      redirect_to root_url
    end
  end

end
