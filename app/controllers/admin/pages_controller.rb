class Admin::PagesController < ApplicationController
  before_action :require_login
  before_action :require_admin
  
  def home
  end
end
