require "rails_helper"

describe ShopsController do
  describe "GET #index" do
    context "guest access" do
      it "should redirect" do
        get :index
        assert_response :redirect
        is_expected.to redirect_to new_user_session_path
      end
    end

    context "user access" do
      before do
        user = FactoryGirl.create :user
        sign_in user
        get :index
      end

      it "should success" do
        assert_response :success
      end
    end
  end

  describe "GET #new" do
    context "guest access" do
      it "should redirect" do
        get :new
        assert_response :redirect
        is_expected.to redirect_to new_user_session_path
      end
    end

    context "user access" do
      before do
        user = FactoryGirl.create :user
        sign_in user
        get :new
      end

      it "should success" do
        assert_response :success
      end
    end
  end

  describe "POST #create" do
    context "guest access" do
      it "should redirect" do
        post :create
        assert_response :redirect
        is_expected.to redirect_to new_user_session_path
      end
    end

    context "user access" do
      before do
        user = FactoryGirl.create :user
        sign_in user
      end

      context "params has blank name" do
        before do
          post :create, params: {shop: {name: nil}}
        end

        it "should render new" do
          assert_response :success
        end
      end

      context "params has valid name" do
        before do
          post :create, params: {shop: {name: "test_name"}}
        end

        it "should redirect_to shops_path" do
          assert_response :redirect
          is_expected.to redirect_to shops_path
        end
      end
    end
  end
end
