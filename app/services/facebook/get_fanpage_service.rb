module Facebook
  class GetFanpageService < BaseService
    def initialize(user)
      @user = user
    end

    def call
      facebook_fanpages
    end

    private
    def facebook_fanpages
      user_graph = Koala::Facebook::API.new @user.facebook_access_token
      fanpage_information = user_graph.get_connections "me", "accounts"
      fanpage_information.map do |fanpage_info|
        FacebookFanpage.new category_name: fanpage_info["category"], token: fanpage_info["access_token"], name: fanpage_info["name"], id: fanpage_info["id"], perms: fanpage_info["perms"]
      end
    end
  end
end
