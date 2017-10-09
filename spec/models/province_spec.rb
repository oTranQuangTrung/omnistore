require "rails_helper"

RSpec.describe Province, type: :model do
  let :province {FactoryGirl.create :province}

  describe "ActiveRecord Validation" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_uniqueness_of :name}
  end

  describe "ActiveRecord Association" do
    it {is_expected.to have_many(:districts).dependent :destroy}
  end
end
