require "rails_helper"

describe Facebook::RetrieveShopCustomer do
  describe ".call" do
    let :shop {FactoryGirl.create :shop}
    let :province {FactoryGirl.create :province}
    let :psid_1 {1}
    let :psid_2 {2}

    before do
      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(
        Faraday::Response.new body: "{\"first_name\":\"Hi\",\"last_name\":\"Hi\",\"profile_pic\":\"picture.jpg\",\"gender\":\"male\",\"id\":\"1\"}", status: 200
      )
    end

    describe "output service" do
      subject {Facebook::RetrieveShopCustomer.call shop, psid_1}
      it "should return customer object" do
        is_expected.to be_a Customer
      end
    end

    describe "commit into database" do
      context "new customer" do
        describe "check number record" do
          it "should change number of record Customer" do
            expect {Facebook::RetrieveShopCustomer.call shop, psid_1}.to change{Customer.count}.by(1)
          end
        end

        describe "attributes update" do
          subject {Facebook::RetrieveShopCustomer.call shop, psid_1}
          it "should create instance Customer with attributes value" do
            expect(subject.profile_picture_url).to eq "picture.jpg"
            expect(subject.name).to eq "Hi Hi"
            expect(subject.facebook_id).to eq psid_1.to_s
          end
        end
      end

      context "exists customer" do
        before {FactoryGirl.create :customer, facebook_id: psid_2, shop_id: shop.id, profile_picture_url: "xxx.jpg", province_id: province.id}

        describe "check number record" do
          it "should not change number of record Customer" do
            expect {Facebook::RetrieveShopCustomer.call shop, psid_2}.to_not change{Customer.count}
          end
        end

        describe "attributes update" do
          subject {Facebook::RetrieveShopCustomer.call shop, psid_2}
          it "should change profile picture url" do
            expect(subject.profile_picture_url).to eq "picture.jpg"
          end
        end
      end
    end
  end
end
