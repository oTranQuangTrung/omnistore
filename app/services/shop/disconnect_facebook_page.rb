class Shop::DisconnectFacebookPage < BaseService
  def initialize shop, facebook_page
    @shop = shop
    @facebook_page = facebook_page
  end

  def call
    remove_facebook_page_info_from_shop &&
      delete_facebook_page_subscribe
  end

  private

  attr_reader :shop, :facebook_page

  def remove_facebook_page_info_from_shop
    shop.update_attributes facebook_page_id: nil, facebook_page_access_token: nil
  end

  def delete_facebook_page_subscribe
    Facebook::SubscribeApp.new(facebook_page).delete
  end
end
