module SessionsHelper
  def login(user)
    # 渡された情報(user)のidでログインする
    session[:user_id] = user.id
  end

  def current_user
    # 変数の値がnilなら変数に代入するが、nilでなければ代入しない (変数の値を変えない)
    # @current_user=current_user OR User.find_by(id: session[user_id])をやってる
    # @current_user =@current_user || User.find_by(id: session[user_id]と下のコードは等しい
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    # ユーザーがログインしていればtrue、その他ならfalseを返す
    !current_user.nil?
  end

  def logout(user)
    session.delete(:user_id)
    # こやつを書いていなかった吉田は１週間以上エラーでした
    @current_user = nil
  end

end
