class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true
      t.string :name, null: false
      t.float :price
      t.string :sku
      t.string :barcode
      t.integer :quantity

      t.timestamps
    end

    add_index :variants, [:product_id, :name], unique: true
  end
end
