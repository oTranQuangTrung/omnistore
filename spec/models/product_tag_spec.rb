require "rails_helper"

RSpec.describe ProductTag, type: :model do
  let(:product_tag) {create(:product_tag)}

  it "has a valid factory" do
    expect(product_tag).to be_valid
  end

  describe "ActiveModel validations" do
    it {expect(product_tag).to validate_uniqueness_of(:product_id).scoped_to(:tag_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:product)}
    it {is_expected.to belong_to(:tag)}
  end
end
