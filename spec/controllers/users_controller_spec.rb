require "rails_helper"

describe UsersController do
  describe "GET #show" do
    before do
      @user = FactoryGirl.create :user
      @another_user = FactoryGirl.create :user
      sign_in @user
    end

    context "is owner" do
      before { get :show, params: { id: @user.id } }
      it "should render show" do
        assert_response :success
      end
    end

    context "not owner" do
      before { get :show, params: { id: @another_user.id } }
      it "should redirect to root" do
        assert_redirected_to root_path
      end
    end
  end
end
