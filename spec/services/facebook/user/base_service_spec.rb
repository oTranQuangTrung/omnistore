require "rails_helper"

describe Facebook::User::BaseService do
  let :user {FactoryGirl.build :user}

  subject {Facebook::User::BaseService.new user}

  it "should response to user" do
    expect(subject.send :user).to eq user
  end

  it "should response to graph_api" do
    expect(subject.send :graph_api).to be_a Koala::Facebook::API
  end
end
