class PostsController < ApplicationController
  def index
    @posts = Post.where(is_active: true).paginate(page: params[:page], per_page: 8)
  end
end
