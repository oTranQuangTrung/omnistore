require "rails_helper"

describe Shops::BaseService do
  let :shop {FactoryGirl.build :shop}

  subject {Shops::BaseService.new shop}

  it "should response to shop" do
    expect(subject.send :shop).to eq shop
  end
end
