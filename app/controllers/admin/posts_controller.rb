class Admin::PostsController < ApplicationController
  def index
    @filter = params[:post_filter]
    if @filter == "published"
      @posts = Post.where(is_active: true).paginate(page: params[:page], per_page: 8)
    elsif @filter == "unpublished"
      @posts = Post.where(is_active: false).paginate(page: params[:page], per_page: 8)
    else
      @posts = Post.paginate(page: params[:page], per_page: 8)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update(is_active: false)

      redirect_to admin_posts_url
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @d_topics = Dtopic.where(post_id: @post.id)
    @d_topic = Dtopic.new
    @i_topics = Itopic.where(post_id: @post.id)
    @i_topic = Itopic.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_back(fallback_location: request.referer)
  end

  def publicate
    @post = Post.find(params[:id])
    @post.update(is_active: true)

    redirect_to admin_posts_url
  end

  def withdraw
    @post = Post.find(params[:id])
    @post.update(is_active: false)

    redirect_to admin_posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_back(fallback_location: request.referer)
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :is_active)
  end
end
