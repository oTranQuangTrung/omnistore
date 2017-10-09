require "rails_helper"

describe Shops::DisconnectFacebookPageService do
  describe ".execute" do
    let :facebook_page {FactoryGirl.create :facebook_page}
    let :shop do
      FactoryGirl.create :shop, facebook_page: facebook_page
    end

    subject {Shops::DisconnectFacebookPageService.new(shop).execute}

    before do
      allow_any_instance_of(Facebook::Page::SubscribeAppService).to receive(:delete).and_return true
    end

    it "should returns true" do
      is_expected.to be true
    end

    it "shop should be updated" do
      subject
      expect(shop.facebook_page).to eq nil
    end
  end
end
