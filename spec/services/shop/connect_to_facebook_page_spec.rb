require "rails_helper"

describe Shop::ConnectToFacebookPage do
  describe ".call" do
    let :shop {FactoryGirl.create :shop}
    let :facebook_page {FactoryGirl.build :facebook_page}

    subject {Shop::ConnectToFacebookPage.call shop, facebook_page}

    before do
      allow_any_instance_of(Facebook::SubscribeApp).to receive(:create).and_return true
    end

    it "should returns true" do
      is_expected.to be true
    end

    it "shop should be updated" do
      subject
      expect(shop.facebook_page_access_token).to eq facebook_page.access_token
      expect(shop.facebook_page_id).to eq facebook_page.id
    end
  end
end
