module Admin::PostsHelper
  def post_btn_color(status)
    @filter == status ? "btn-dark" : "btn-outline-dark"
  end

  def active_post(post)
    if post.is_active == true
      "font-weight-bold"
    end
  end
end
