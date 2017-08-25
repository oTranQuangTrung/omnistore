class AddFacebookPageInfoToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :facebook_page_id, :string
    add_column :shops, :facebook_page_access_token, :string
  end
end
