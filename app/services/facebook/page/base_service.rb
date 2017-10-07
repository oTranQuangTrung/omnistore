class Facebook::Page::BaseService < BaseService
  def initialize facebook_page
    @facebook_page = facebook_page
    @graph_api = Koala::Facebook::API.new facebook_page.access_token
  end

  private
  attr_reader :facebook_page, :graph_api
end

