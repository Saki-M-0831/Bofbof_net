class PagesController < ApplicationController
  def home
    @notices = Notice.where(to_show: true)
    @contact = Contact.new
    @users = User.where(is_admin: true).paginate(page: params[:page], per_page: 4)
  end

  def about
  end
end
