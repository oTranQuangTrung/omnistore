class Shop::ConnectToFacebookPage < BaseService
  def initialize shop, facebook_page
    @shop = shop
    @facebook_page = facebook_page
  end

  def call
    update_facebook_page_info_into_shop &&
      subscribe_facebook_page_to_app
  end

  private

  attr_reader :shop, :facebook_page

  def update_facebook_page_info_into_shop
    shop.update_attributes facebook_page_id: facebook_page.id,
      facebook_page_access_token: facebook_page.access_token
  end

  def subscribe_facebook_page_to_app
    Facebook::SubscribeApp.new(facebook_page).create
  end
end
