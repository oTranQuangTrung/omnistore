require "rails_helper"

describe Shop::DisconnectFacebookPage do
  describe ".call" do
    let :facebook_page {FactoryGirl.build :facebook_page}
    let :shop do
      FactoryGirl.create :shop,
        facebook_page_id: facebook_page.id,
        facebook_page_access_token: facebook_page.access_token
    end

    subject {Shop::DisconnectFacebookPage.call shop, facebook_page}

    before do
      allow_any_instance_of(Facebook::SubscribeApp).to receive(:delete).and_return true
    end

    it "should returns true" do
      is_expected.to be true
    end

    it "shop should be updated" do
      subject
      expect(shop.facebook_page_access_token).to eq nil
      expect(shop.facebook_page_id).to eq nil
    end
  end
end
