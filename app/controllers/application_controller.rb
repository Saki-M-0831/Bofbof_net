class ApplicationController < ActionController::Base
  
  include SessionsHelper
  before_action :require_login

  def require_admin
    unless current_user.is_admin == true
      flash.now[:error] = "You do not have the access to this section"

      redirect_to root_url
    end
  end

  def require_login
    unless logged_in?
    end
  end

end
