class AddColumnsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :shop, foreign_key: true
    add_column :products, :description, :text
    add_reference :products, :category, foreign_key: true
    add_reference :products, :vendor, foreign_key: true
    add_column :products, :price, :float
    add_column :products, :sku, :string
    add_column :products, :barcode, :string
    add_column :products, :inventory, :integer, default: 0
    add_column :products, :quantity, :integer, default: 0
    add_column :products, :weight, :float, default: 0
    add_column :products, :shipping, :boolean, default: true
    add_column :products, :visibility, :integer, default: 0
  end
end
