require "rails_helper"

RSpec.describe Collection, type: :model do
  let(:collection) {create :collection}

  it "has a valid factory" do
    expect(collection).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name).scoped_to(:shop_id)}
    it {is_expected.to validate_length_of(:name).is_at_most(200)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to have_many(:collection_products).dependent(:destroy)}
    it {is_expected.to have_many(:products).through(:collection_products)}
    it {is_expected.to belong_to(:shop)}
  end

  describe "ActiveRecord scopes" do
    describe ".lastest" do
      let(:sql) do
        "SELECT `collections`.* FROM `collections` ORDER BY `collections`.`created_at` DESC"
      end

      subject {Collection.lastest.to_sql.squish}

      it {is_expected.to eq sql}
    end
  end
end
