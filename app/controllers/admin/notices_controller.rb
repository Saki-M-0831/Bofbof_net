class Admin::NoticesController < ApplicationController

  def index
    @filter = params[:notice_filter]
    if @filter == "published"
      @notices = Notice.where(to_show: true).paginate(page: params[:page], per_page: 8)
    elsif @filter == "unpublished"
      @notices = Notice.where(to_show: false).paginate(page: params[:page], per_page: 8)
    else
      @notices = Notice.paginate(page: params[:page], per_page: 8)
    end
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
       @notice.update(to_show: false)

      redirect_to admin_notices_url
    else
      render "new"
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update(notice_params)

    redirect_back(fallback_location: request.referer)
    flash[:success] = "お知らせを編集しました！"
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    flash[:success] = "お知らせを削除しました！"

    redirect_back(fallback_location: request.referer)
  end

  def publicate
    @notice = Notice.find(params[:id])
    @notice.update(to_show: true)
    flash[:success] = "お知らせを掲載しました！"

    redirect_to admin_notices_url
  end

  def withdraw
    @notice = Notice.find(params[:id])
    @notice.update(to_show: false)
    flash[:success] = "お知らせを隠しました！"

    redirect_to admin_notices_url
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :content, :to_show)
  end

end
