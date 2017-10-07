class Shops::ConnectToFacebookPageService < Shops::BaseService
  def execute user, facebook_page
    case
    when !(user.ownable? facebook_page)
      @error = :not_ownable
    when shop.facebook_page_id.present?
      @error = :shop_connected
    when (Shop.exists? facebook_page_id: facebook_page.id)
      @error = :facebook_page_connected
    else
      shop.update_attributes facebook_page_id: facebook_page.id
      Facebook::Page::SubscribeAppService.new(facebook_page).create
    end
  end
end
