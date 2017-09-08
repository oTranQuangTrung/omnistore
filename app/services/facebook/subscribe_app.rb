class Facebook::SubscribeApp
  def initialize facebook_page
    @facebook_page = facebook_page
  end

  def create
    response = make_request :post
    response.success?
  end

  def delete
    response = make_request :delete
    response.success?
  end

  private

  attr_reader :facebook_page

  def make_request method
    conn = Faraday.new url: subscribe_apps_url
    conn.send(method) do |req|
      req.params["access_token"] = facebook_page.access_token
    end
  end

  def subscribe_apps_url
    File.join Settings.facebook.host, facebook_page.id, "subscribed_apps"
  end
end
