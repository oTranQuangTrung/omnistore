class CreateCustomerAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_addresses do |t|
      t.references :customer
      t.references :province
      t.references :district

      t.timestamps
    end
    add_index :customer_addresses, [:customer_id, :province_id, :district_id], unique: true, name: "customer_address_index"
  end
end
