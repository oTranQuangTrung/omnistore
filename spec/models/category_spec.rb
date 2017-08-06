require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "association" do
    it "should has many products" do
      should have_many(:products).dependent(:destroy)
    end

    it "should belongs to shop" do
      should belong_to(:shop)
    end
  end
end
