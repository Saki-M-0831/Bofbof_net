class Admin::UsersController < ApplicationController
  def index
    @users = Users.paginate(page: params[:page], per_page: 8)
  end
end
