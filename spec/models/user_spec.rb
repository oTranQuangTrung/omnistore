require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association" do
    it "should has many user_shops" do
      should have_many(:user_shops).dependent(:destroy)
    end

    it "should has many shops" do
      should have_many(:shops)
    end
  end
end
