require "rails_helper"

RSpec.describe CollectionProduct, type: :model do
  let(:collection_product) {create(:collection_product)}

  it "has a valid factory" do
    expect(collection_product).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:product_id)}
    it {is_expected.to validate_presence_of(:collection_id)}
    it {expect(collection_product).to validate_uniqueness_of(:product_id).scoped_to(:collection_id)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to belong_to(:product)}
    it {is_expected.to belong_to(:collection)}
  end
end
