require "rails_helper"

RSpec.describe CustomerAddress, type: :model do
  let :customer_address {FactoryGirl.create :customer_address}
  describe "ActiveRecord Association" do
    it {is_expected.to belong_to :customer}
    it {is_expected.to belong_to :province}
    it {is_expected.to belong_to :district}
  end
  
  describe "ActiveModel Validations" do
    it {expect(customer_address).to validate_uniqueness_of :customer_id}
  end
end
