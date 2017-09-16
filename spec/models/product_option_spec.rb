require "rails_helper"

RSpec.describe ProductOption, type: :model do
  let(:product_option) {create(:product_option)}

  it "has a valid factory" do
    expect(product_option).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:value)}
    it {is_expected.to validate_uniqueness_of(:value).scoped_to(:product_id, :option_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:product)}
    it {is_expected.to belong_to(:option)}
  end
end
