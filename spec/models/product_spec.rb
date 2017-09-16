require "rails_helper"

RSpec.describe Product, type: :model do
  let(:product) {create(:product)}

  it "has a valid factory" do
    expect(product).to be_valid
  end

  describe "ActiveModel define" do
    it {is_expected.to define_enum_for(:inventory).with([:in_stock, :out_of_stock])}
    it {is_expected.to define_enum_for(:visibility).with([:publish, :unpublished])}
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :shop_id}
    it {is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to 0}
    it {is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to 0}
    it {is_expected.to validate_numericality_of(:weight).is_greater_than_or_equal_to 0}
  end



  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:shop)}
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:vendor)}
    it {is_expected.to have_many(:collection_products).dependent(:destroy)}
    it {is_expected.to have_many(:product_options).dependent(:destroy)}
    it {is_expected.to have_many(:product_tags).dependent(:destroy)}
    it {is_expected.to have_many(:variants).dependent(:destroy)}
    it {is_expected.to have_many(:collections).through(:collection_products)}
    it {is_expected.to have_many(:options).through(:product_options)}
    it {is_expected.to have_many(:tags).through(:product_tags)}
  end
end
