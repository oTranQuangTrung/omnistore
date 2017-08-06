require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "association" do
    it "should belongs to category" do
      should belong_to(:category)
    end
  end
end
