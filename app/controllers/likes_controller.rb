class LikesController < ApplicationController
  def comment_like
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create(user_id: current_user.id)

    redirect_to edit_admin_post_url(@post, anchor: "comment")
  end

  def comment_dislike
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @like = Like.find(params[:like_id])
    @like.destroy

    redirect_to edit_admin_post_url(@post, anchor: "comment")
  end
end
