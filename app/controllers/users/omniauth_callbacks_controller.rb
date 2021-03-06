class Users::OmniauthCallbacksController < ApplicationController
  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
  # binding.pry
  @user = User.from_omniauth(request.env["omniauth.auth"])

  if @user.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
    sign_in_and_redirect @user, event: :authentication
  else #ユーザー情報が未登録なので、新規登録画面へ遷移する
    render template: 'devise/registrations/new'
  end
end
end

