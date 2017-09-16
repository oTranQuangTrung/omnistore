require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) {create(:category)}

  it "has a valid factory" do
    expect(category).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:shop_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to have_many(:products)}
    it {is_expected.to belong_to(:shop)}
  end
end
