class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :profile_picture_url
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :facebook_id
      t.integer :shop_id

      t.timestamps
    end
    add_index :customers, [:facebook_id, :shop_id], unique: true
  end
end
