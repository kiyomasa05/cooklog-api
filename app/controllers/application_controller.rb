class ApplicationController < ActionController::API
  include ActionController::Helpers
  skip_before_action :verify_authenticity_token, raise: false
  # Railsが認証トークンを使用しないように
  helper_method :login, :current_user

  # セッションに引数のuserのidを格納する
  def login(user)
  # def login!
    session[:user_id] = user.id
    # binding.pry
  end

  # 一時cookiesは自動的に暗号化
  # インスタンス変数の「@current_user」がFalse（nil）の場合、Userモデルから現在ログインしているユーザーidと一致する情報を代入する
  def current_user
    if session[:user_id]
      # @current_user ||= User.find_by(id: session[:user_id])
      @current_user ||= User.find(session[:user_id])
    end
  end
end
# Userの探し方を変えた
# 変わらなかった
# login に！をつけた sessionに入っていない可能性があるので。
# かわらなかった
