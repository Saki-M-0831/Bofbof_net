module UsersHelper
  def btn_color(status)
    @filter == status ? "btn-dark" : "btn-outline-dark"
  end

  def admin_user(user)
    if user.is_admin == true
      "font-weight-bold"
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
