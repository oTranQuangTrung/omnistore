require "rails_helper"

describe Facebook::GraphApi do
  describe ".call" do
    subject {Facebook::GraphApi.call Faker::Crypto.md5}

    it "should returns Koala::Facebook::API instance" do
      is_expected.to be_a Koala::Facebook::API
    end
  end
end
