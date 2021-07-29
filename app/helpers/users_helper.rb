module UsersHelper
  def btn_color(status)
    @filter == status ? "btn-dark" : "btn-outline-dark"
  end

  def admin_user(user)
    if user.is_admin == true
      "font-weight-bold"
    end
  end
  
end
