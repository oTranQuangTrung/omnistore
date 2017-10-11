require "rails_helper"

RSpec.describe Customer, type: :model do

  describe "ActiveRecord Association" do                                                                                                                     
    it {is_expected.to have_one(:customer_address).dependent :destroy}                 
  end
end
