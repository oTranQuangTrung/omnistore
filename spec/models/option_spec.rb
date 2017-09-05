require "rails_helper"

RSpec.describe Option, type: :model do
  let(:option) {create(:option)}

  it "has a valid factory" do
    expect(option).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:shop_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:shop)}
    it {is_expected.to have_many(:product_options).dependent(:destroy)}
    it {is_expected.to have_many(:products).through(:product_options)}
  end
end
