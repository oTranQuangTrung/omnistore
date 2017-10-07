require "rails_helper"

describe Facebook::Page::BaseService do
  let :facebook_page {FactoryGirl.build :facebook_page}

  subject {Facebook::Page::BaseService.new facebook_page}

  it "should response to facebook_page" do
    expect(subject.send :facebook_page).to eq facebook_page
  end

  it "should response to graph_api" do
    expect(subject.send :graph_api).to be_a Koala::Facebook::API
  end
end
