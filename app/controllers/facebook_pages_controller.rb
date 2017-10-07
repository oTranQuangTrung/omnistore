class FacebookPagesController < ApplicationController
  before_action :handle_user_not_has_any_shop

  def index
    @facebook_pages = current_user.facebook_pages
  end
end
