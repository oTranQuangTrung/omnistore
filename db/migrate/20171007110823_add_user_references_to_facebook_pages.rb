class AddUserReferencesToFacebookPages < ActiveRecord::Migration[5.1]
  def change
    add_reference :facebook_pages, :user, foreign_key: true
  end
end
