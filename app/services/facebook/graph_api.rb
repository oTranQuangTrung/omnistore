class Facebook::GraphApi < BaseService
  def initialize access_token
    @access_token = access_token
  end

  def call
    Koala::Facebook::API.new access_token
  end

  private
  attr_reader :access_token
end
