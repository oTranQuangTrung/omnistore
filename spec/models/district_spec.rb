require "rails_helper"

RSpec.describe District, type: :model do
  let :district {FactoryGirl.create :district}

  describe "ActiveRecord Validation" do
    it {is_expected.to validate_presence_of :name}
  end

  describe "ActiveRecord Association" do
    it {is_expected.to belong_to :province}
  end
end
