class PostsController < ApplicationController
  def index
    @active_posts = Post.where(is_active: true)
    @q = @active_posts.ransack(params[:q])
    @posts = @q.result(distinct: true).paginate(page: params[:page], per_page: 6)
  end
end
