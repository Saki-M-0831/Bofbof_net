class Admin::VideosController < ApplicationController
  def index
    @videos = Video.paginate(page: params[:page], per_page: 8)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = "動画情報をアップしました！"

      redirect_to admin_videos_url
    else 
      flash[:danger] = "動画情報をアップできませんでした。もう一度試してください！"

      redirect_back(fallback_location: request.referer)
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      flash[:success] = "動画情報を変更しました！"

      redirect_to admin_videos_url
    else
      flash[:danger] = "動画情報を変更できませんでした。もう一度試してください！"

      redirect_back(fallback_location: request.referer)
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      flash[:success] = "動画投稿を削除しました！"
    else
      flash[:danger] = "削除に失敗しました。"
    end
    redirect_back(fallback_location: request.referer)
  end

  def video_params
    params.require(:video).permit(:link, :title, :content, :picture)
  end
end
