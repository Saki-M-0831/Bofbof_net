class Admin::DtopicsController < ApplicationController
  before_action :require_login
  before_action :require_admin
  
  def create
    @post = Post.find(params[:post_id])
    @d_topic = @post.dtopics.new(dtopic_params)
    if @d_topic.save
      flash[:success] = "ニュースの候補を追加しました"
    else
      flash[:error] = "1つのニュースあたり42文字以下にしてください。"
    end
    redirect_to edit_admin_post_url(@post, anchor: "dtopic")
  end

  def d_choose
    @post = Post.find(params[:post_id])
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.update(is_chosen: true)

    redirect_to edit_admin_post_url(@post, anchor: "dtopic")
  end

  def d_omit
    @post = Post.find(params[:post_id])
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.update(is_chosen: false)

    redirect_to edit_admin_post_url(@post, anchor: "dtopic")
  end

  def destroy
    @post = Post.find(params[:post_id])
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.destroy

    redirect_to edit_admin_post_url(@post, anchor: "dtopic")
  end

  def dtopic_params
    params.require(:dtopic).permit(:content)
  end
end
