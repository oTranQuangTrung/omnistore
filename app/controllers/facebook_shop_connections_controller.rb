class FacebookShopConnectionsController < ApplicationController
  before_action :load_and_handle_not_found_facebook_page, only: :create

  def create
    connect_to_facebook_page_service = Shops::ConnectToFacebookPageService.new current_shop
    connect_to_facebook_page_service.execute current_user, @facebook_page

    if connect_to_facebook_page_service.success?
      flash[:success] = t ".success.connected"
      redirect_to facebook_chat_path
    else
      flash[:alert] = t ".alert.#{connect_to_facebook_page_service.error}"
      redirect_to request.referer
    end
  end

  def destroy
    if current_shop.update_attributes facebook_page_id: nil
      flash[:success] = t ".success"
      redirect_to facebook_pages_path
    else
      flash[:alert] = t ".alert"
      redirect_to request.referer
    end
  end

  private
  def load_and_handle_not_found_facebook_page
    @facebook_page = current_user.facebook_pages.find_by id: params[:facebook_page_id]
    unless @facebook_page
      flash[:alert] = t ".alert.facebook_page_not_found"
      redirect_to request.referer
    end
  end
end
