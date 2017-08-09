require "rails_helper"

RSpec.describe UserShop, type: :model do
  describe "association" do
    it "should belongs to user" do
      should belong_to(:user)
    end

    it "should belongs to shop" do
      should belong_to(:shop)
    end
  end
end
