class Shops::BaseService < BaseService
  def initialize shop
    @shop = shop
  end

  private
  attr_reader :shop
end
