class Admin::ItopicsController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def create
    @post = Post.find(params[:post_id])
    @i_topic = @post.itopics.new(itopic_params)
    if @i_topic.save
      flash[:success] = "ニュースの候補を追加しました"
      redirect_back(fallback_location: request.referer)
    else
      flash[:danger] = "1つのニュースあたり42文字以下にしてください。"
      redirect_back(fallback_location: request.referer)
    end
  end

  def i_choose
    @i = params[:itopic_id]
    @topic = Itopic.find_by(id: @i)
    @topic.update(is_chosen: true)

    redirect_back(fallback_location: request.referer)
  end

  def i_omit
    @i = params[:itopic_id]
    @topic = Itopic.find_by(id: @i)
    @topic.update(is_chosen: false)

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @i = params[:itopic_id]
    @topic = Itopic.find_by(id: @i)
    @topic.destroy

    redirect_back(fallback_location: request.referer)
  end

  def itopic_params
    params.require(:itopic).permit(:content)
  end
end
