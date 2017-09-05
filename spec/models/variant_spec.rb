require "rails_helper"

RSpec.describe Variant, type: :model do
  let(:variant) {create(:variant)}

  it "has a valid factory" do
    expect(variant).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:product_id)}
    it {is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to 0}
    it {is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to 0}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:product)}
  end
end
