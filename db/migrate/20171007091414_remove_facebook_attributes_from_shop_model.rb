class RemoveFacebookAttributesFromShopModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :shops, :facebook_page_access_token
    remove_column :shops, :facebook_page_id
  end
end
