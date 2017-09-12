require "rails_helper"

describe Facebook::PageList do
  describe ".call" do
    let :user {FactoryGirl.create :user}

    before do
      allow_any_instance_of(Koala::Facebook::API).to receive(:get_connections)
        .with("me", "accounts") {
          [
            {"access_token"=>"Dfkg*34hj23js",
            "category"=>"Nonprofit Organization",
            "name"=>"Page 1",
            "id"=>"111744839465038",
            "perms"=>["ADMINISTER", "EDIT_PROFILE"]},
           {"access_token"=>"Nvkld07kfdnf",
            "category"=>"Fictional Character",
            "name"=>"Page 2",
            "id"=>"137456550160851",
            "perms"=>["ADMINISTER", "EDIT_PROFILE"]},
           {"access_token"=>"xm95jdnay4",
            "category"=>"Community Organization",
            "name"=>"Page 3",
            "id"=>"180132715342280",
            "perms"=>["ADMINISTER", "EDIT_PROFILE"]}
          ]
      }
    end

    subject {Facebook::PageList.call user}

    it "should returns array of FacebookPage" do
      is_expected.to all(be_a(FacebookPage))
    end
  end
end
