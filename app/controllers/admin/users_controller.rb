class Admin::UsersController < ApplicationController
  before_action :require_login
  
  def index
    @filter = params[:user_filter]
    if @filter == "admin"
      @users = User.where(is_admin: true).paginate(page: params[:page], per_page: 8)
    elsif @filter == "non-admin"
      @users = User.where(is_admin: false).paginate(page: params[:page], per_page: 8)
    else
      @users = User.paginate(page: params[:page], per_page: 8)
    end
  end

  def set_admin
    @user = User.find(params[:id])
    @user.update(is_admin: true)

    redirect_back(fallback_location: request.referer)
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update(is_admin: false)

    redirect_back(fallback_location: request.referer)
  end
end
