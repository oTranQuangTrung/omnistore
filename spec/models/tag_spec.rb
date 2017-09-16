require "rails_helper"

RSpec.describe Tag, type: :model do
  let(:tag) {create(:tag)}

  it "has a valid factory" do
    expect(tag).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:shop_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to have_many(:product_tags).dependent(:destroy)}
    it {is_expected.to have_many(:products).through(:product_tags)}
    it {is_expected.to belong_to(:shop)}
  end
end
