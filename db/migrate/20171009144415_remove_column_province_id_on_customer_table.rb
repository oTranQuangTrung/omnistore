class RemoveColumnProvinceIdOnCustomerTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :province_id, :integer
  end
end
