class FacebookChatsController < ApplicationController
  before_action :handle_user_not_has_any_shop
  before_action :handle_shop_not_connected_to_facebook_page, only: :show

  def show
    # TODO
  end

  private
  def handle_shop_not_connected_to_facebook_page
    unless current_shop.facebook_page_id
      redirect_to facebook_pages_path
    end
  end
end
