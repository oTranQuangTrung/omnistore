class AddProvinceRefToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :province_id, :integer
    add_index :customers, [:id, :province_id], unique: true
  end
end
