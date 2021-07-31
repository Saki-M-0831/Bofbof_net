class Admin::CommentsController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to edit_admin_post_url(@post, anchor: "comment")
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @c = params[:comment_id]
    @comment = Comment.find_by(id: @c)
    if @comment.destroy
      redirect_to edit_admin_post_url(@post, anchor: "comment")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
