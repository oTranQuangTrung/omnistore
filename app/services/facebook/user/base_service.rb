class Facebook::User::BaseService < BaseService
  def initialize user
    @user = user
    @graph_api = Koala::Facebook::API.new user.facebook_access_token
  end

  private
  attr_reader :user, :graph_api
end
