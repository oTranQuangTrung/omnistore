class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def facebook
    user = User.from_omniauth request.env["omniauth.auth"]
    sign_in_and_redirect user, event: :authentication
    remember_me user
    set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  end

  def failure
    redirect_to root_path
  end
end
