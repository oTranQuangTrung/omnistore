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

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(shop).to respond_to(:connect_to_facebook_page) }
      it { expect(shop).to respond_to(:disconnect_facebook_page) }
    end

    context "executes methods correctly" do
      context "#connect_to_facebook_page" do
        #TODO
      end

      context "#disconnect_facebook_page" do
        #TODO
      end
    end
  end
end
