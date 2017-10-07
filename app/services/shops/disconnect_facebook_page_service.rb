class Shops::DisconnectFacebookPageService < Shops::BaseService
  def execute
    delete_facebook_page_subscribe
    shop.update_attributes(facebook_page_id: nil)
  end

  private
  def delete_facebook_page_subscribe
    Facebook::Page::SubscribeAppService.new(shop.facebook_page).delete
  end
end
