class Admin::DtopicsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @d_topic = @post.dtopics.new(dtopic_params)
    if @d_topic.save
      redirect_back(fallback_location: request.referer)
    else
      redirect_back(fallback_location: request.referer)
    end
  end

  def d_choose
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.update(is_chosen: true)

    redirect_back(fallback_location: request.referer)
  end

  def d_omit
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.update(is_chosen: false)

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @d = params[:dtopic_id]
    @topic = Dtopic.find_by(id: @d)
    @topic.destroy

    redirect_back(fallback_location: request.referer)
  end

  def dtopic_params
    params.require(:dtopic).permit(:content)
  end
end
