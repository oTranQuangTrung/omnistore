class Facebook::User::UpdateFacebookPageListService < Facebook::User::BaseService
  def execute
    begin
      ActiveRecord::Base.transaction do
        destroy_old_page
        create_new_facebook_page_records
      end
    rescue
      # TODO Alert to admin
      false
    end
  end

  private
  def destroy_old_page
    user.facebook_pages.destroy_all
  end

  def create_new_facebook_page_records
    page_list_data = graph_api.get_connections "me", "accounts"
    page_list_data.map do |page_data|
      user.facebook_pages.create! category: page_data["category"], access_token: page_data["access_token"],
        name: page_data["name"], fid: page_data["id"]
    end
  end
end
