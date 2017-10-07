require "rails_helper"

describe Shops::ConnectToFacebookPageService do
  describe ".execute" do
    before do
      allow_any_instance_of(Facebook::Page::SubscribeAppService).to receive(:create).and_return true
    end

    context "not ownable" do
      let :shop {FactoryGirl.create :shop}
      let :user_1 {FactoryGirl.create :user}
      let :user_2 {FactoryGirl.create :user}
      let :facebook_page {FactoryGirl.create :facebook_page, user: user_2}

      subject {Shops::ConnectToFacebookPageService.new shop}

      before do
        subject.execute user_1, facebook_page
      end

      it "should have error :not_ownable" do
        expect(subject.error).to eq :not_ownable
      end

      it "should response .success? false" do
        expect(subject.success?).to eq false
      end

      it "should not create relationship shop to facebook_page" do
        expect(shop.facebook_page).to_not eq facebook_page
      end
    end

    context "shop already connected" do
      let :user {FactoryGirl.create :user}
      let :facebook_page_1 {FactoryGirl.create :facebook_page, user: user}
      let :facebook_page_2 {FactoryGirl.create :facebook_page, user: user}
      let :shop {FactoryGirl.create :shop, facebook_page: facebook_page_1}

      subject {Shops::ConnectToFacebookPageService.new shop}

      before do
        subject.execute user, facebook_page_2
      end

      it "should have error :shop_connected" do
        expect(subject.error).to eq :shop_connected
      end

      it "should response .success? false" do
        expect(subject.success?).to eq false
      end

      it "should not create relationship shop to facebook_page" do
        expect(shop.facebook_page).to_not eq facebook_page_2
      end
    end

    context "Facebook Page already connected" do
      let :user {FactoryGirl.create :user}
      let :facebook_page {FactoryGirl.create :facebook_page, user: user}
      let! :shop_1 {FactoryGirl.create :shop, facebook_page: facebook_page}
      let :shop_2 {FactoryGirl.create :shop}

      subject {Shops::ConnectToFacebookPageService.new shop_2}

      before do
        subject.execute user, facebook_page
      end

      it "should have error :facebook_page_connected" do
        expect(subject.error).to eq :facebook_page_connected
      end

      it "should response .success? false" do
        expect(subject.success?).to eq false
      end

      it "should not create relationship shop to facebook_page" do
        expect(shop_2.facebook_page).to_not eq facebook_page
      end
    end

    context "success" do
      let :user {FactoryGirl.create :user}
      let :facebook_page {FactoryGirl.create :facebook_page, user: user}
      let! :shop {FactoryGirl.create :shop}

      subject {Shops::ConnectToFacebookPageService.new shop}

      before do
        subject.execute user, facebook_page
      end

      it "should have error nil" do
        expect(subject.error).to eq nil
      end

      it "should response .success? true" do
        expect(subject.success?).to eq true
      end

      it "should create relationship shop to facebook_page" do
        expect(shop.facebook_page).to eq facebook_page
      end
    end

  end
end
