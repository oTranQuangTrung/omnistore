require "rails_helper"

RSpec.describe FacebookPage, type: :model do
  describe "association" do
    it "should belongs to user" do
      should belong_to(:user)
    end
  end
end
