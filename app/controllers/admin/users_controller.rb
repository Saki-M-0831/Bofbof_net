class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end
end