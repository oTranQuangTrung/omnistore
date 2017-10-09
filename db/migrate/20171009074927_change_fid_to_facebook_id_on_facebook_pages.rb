class ChangeFidToFacebookIdOnFacebookPages < ActiveRecord::Migration[5.1]
  def change
    rename_column :facebook_pages, :fid, :facebook_id
    add_index :facebook_pages, :facebook_id
  end
end
