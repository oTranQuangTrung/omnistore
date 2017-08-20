module Facebook
  class PageListService < BaseService
    def initialize user
      @user = user
    end

    def call
      page_list
    end

    private
    def page_list
      user_graph_api = Koala::Facebook::API.new @user.facebook_access_token
      page_list_information = user_graph_api.get_connections "me", "accounts"
      page_list_information.map do |page_info|
        FacebookPage.new category_name: page_info["category"], access_token: page_info["access_token"], name: page_info["name"], id: page_info["id"], perms: page_info["perms"]
      end
    end
  end
end
