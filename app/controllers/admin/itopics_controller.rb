class Admin::ItopicsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @i_topic = @post.itopics.new(itopic_params)
    if @i_topic.save
      redirect_back(fallback_location: request.referer)
    else
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
