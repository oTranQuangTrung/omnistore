class ShopsController < ApplicationController
  def index
    @shops = current_user.shops
  end

  def new
    @shop = current_user.shops.new
  end

  def create
    @shop = current_user.shops.create shop_params
    if @shop.persisted?
      flash[:success] = t ".success"
      redirect_to shops_path
    else
      flash[:alert] = t ".error"
      render :new
    end
  end

  def set_current_shop
    cookies["current_shop_user_#{current_user.id}"] = params[:shop_id]
    redirect_to request.referer
  end

  def connect_to_facebook_page
    update_facebook_page_info_to_current_shop
    redirect_to facebook_chat_path
  end

  def disconnect_facebook_page
    current_shop.update_attributes facebook_page_id: nil,
      facebook_page_access_token: nil
    redirect_to facebook_pages_path
  end

  private
  def shop_params
    params.require(:shop).permit :name
  end

  def update_facebook_page_info_to_current_shop
    current_shop.update_attributes facebook_page_id: facebook_page.id,
      facebook_page_access_token: facebook_page.access_token
  end

  def facebook_page
    user_graph_api = Facebook::GraphApiService.call current_user.facebook_access_token

    facebook_page_id = params[:facebook_page_id]
    access_token = user_graph_api.get_page_access_token facebook_page_id

    FacebookPage.new id: facebook_page_id, access_token: access_token
  end
end
