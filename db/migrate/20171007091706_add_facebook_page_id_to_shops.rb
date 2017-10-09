class AddFacebookPageIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :facebook_page, foreign_key: true
  end
end
