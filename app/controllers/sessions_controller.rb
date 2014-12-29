class SessionsController < ApplicationController
  def callback
    #omniauth.auth環境変数を取得
    auth = request.env["omniauth.auth"]

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "ログインしました。"
    else
      User.create_with_omniauth(auth)
      redirect_to root_url, :notice => "#{auth["info"]["name"]}さんの#{auth["provider"]}アカウントでログインしました"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
