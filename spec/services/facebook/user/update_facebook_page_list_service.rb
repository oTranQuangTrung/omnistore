require "rails_helper"

describe Facebook::User::UpdateFacebookPageListService do
  describe ".execute" do
    describe "success" do
      let :user {FactoryGirl.create :user}
      let! :facebook_page_1 {FactoryGirl.create :facebook_page, user: user, fid: "fid_1"}
      let! :facebook_page_2 {FactoryGirl.create :facebook_page, user: user, fid: "fid_2"}

      subject {Facebook::User::UpdateFacebookPageListService.new(user).execute}

      before do
        allow_any_instance_of(Koala::Facebook::API).to receive(:get_connections)
          .with("me", "accounts") {
            [
              {"access_token"=>"Dfkg*34hj23js",
              "category"=>"Nonprofit Organization",
              "name"=>"Page 1",
              "id"=>"fid_3",
              "perms"=>["ADMINISTER", "EDIT_PROFILE"]},
             {"access_token"=>"Nvkld07kfdnf",
              "category"=>"Fictional Character",
              "name"=>"Page 2",
              "id"=>"fid_4",
              "perms"=>["ADMINISTER", "EDIT_PROFILE"]},
             {"access_token"=>"xm95jdnay4",
              "category"=>"Community Organization",
              "name"=>"Page 3",
              "id"=>"fid_5",
              "perms"=>["ADMINISTER", "EDIT_PROFILE"]}
            ]
        }

        subject
      end

      it "should destroy old facebook pages" do
        expect([facebook_page_1.id, facebook_page_2.id] & user.facebook_page_ids).to eq []
      end

      it "should create new facebook pages" do
        expect(user.facebook_pages.pluck :fid).to eq %w(fid_3 fid_4 fid_5)
      end
    end
  end
end
