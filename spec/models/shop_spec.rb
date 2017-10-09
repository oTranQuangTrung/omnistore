require "rails_helper"

RSpec.describe Shop, type: :model do
  let(:shop) {create(:shop)}

  it "has a valid factory" do
    expect(shop).to be_valid
  end

  describe "ActiveModel validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "ActiveRecord associations" do
    it {is_expected.to have_many(:user_shops).dependent(:destroy)}
    it {is_expected.to have_many(:users).through(:user_shops)}
    it {is_expected.to have_many(:collections).dependent(:destroy)}
    it {is_expected.to have_many(:categories).dependent(:destroy)}
    it {is_expected.to have_many(:options).dependent(:destroy)}
    it {is_expected.to have_many(:products).dependent(:destroy)}
    it {is_expected.to have_many(:tags).dependent(:destroy)}
    it {is_expected.to have_many(:vendors).dependent(:destroy)}
  end
end
