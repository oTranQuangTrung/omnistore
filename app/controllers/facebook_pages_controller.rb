class FacebookPagesController < ApplicationController
  def index
    @pages = Facebook::PageListService.call current_user
  rescue Koala::Facebook::AuthenticationError
    sign_out_and_redirect current_user
  end
end
