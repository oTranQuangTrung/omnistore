class FacebookPagesController < ApplicationController
  before_action :handle_user_not_has_any_shop

  def index
    @facebook_pages = Facebook::PageList.call current_user
  rescue Koala::Facebook::AuthenticationError
    sign_out_and_redirect current_user
  end
end
