require "rails_helper"

describe Facebook::Page::SubscribeAppService do
  let :facebook_page {FactoryGirl.build :facebook_page}

  describe ".create" do
    subject {Facebook::Page::SubscribeAppService.new(facebook_page).create}

    before do
      allow_any_instance_of(Faraday::Connection).to receive(:post) {
        Faraday::Response.new status: 200
      }
    end

    it "should return true" do
      is_expected.to eq true
    end
  end

  describe ".delete" do
    subject {Facebook::Page::SubscribeAppService.new(facebook_page).delete}

    before do
      allow_any_instance_of(Faraday::Connection).to receive(:delete) {
        Faraday::Response.new status: 200
      }
    end

    it "should return true" do
      is_expected.to eq true
    end
  end
end
