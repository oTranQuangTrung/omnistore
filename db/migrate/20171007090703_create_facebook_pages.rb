class CreateFacebookPages < ActiveRecord::Migration[5.1]
  def change
    create_table :facebook_pages do |t|
      t.string :access_token
      t.string :category
      t.string :name
      t.string :fid

      t.timestamps
    end
  end
end
