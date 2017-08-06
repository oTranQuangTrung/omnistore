require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe "association" do
    it "should has many user_shops" do
      should have_many(:user_shops).dependent(:destroy)
    end

    it "should has many users" do
      should have_many(:users)
    end

    it "should has many categories" do
      should have_many(:categories).dependent(:destroy)
    end
  end
end
