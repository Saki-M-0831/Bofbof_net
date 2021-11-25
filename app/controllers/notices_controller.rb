class NoticesController < ApplicationController
  def index
    @active_notices = Post.where(is_active: true)
    @notices = @q.result(distinct: true).paginate(page: params[:page], per_page: 6)
  end

  def show
    @notice = Notice.find(params[:id])
  end
end
