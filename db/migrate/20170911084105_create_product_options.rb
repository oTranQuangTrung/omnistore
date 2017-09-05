class CreateProductOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_options do |t|
      t.references :product, foreign_key: true
      t.references :option, foreign_key: true
      t.string :value, null: false

      t.timestamps
    end

    add_index :product_options, [:product_id, :option_id, :value], unique: true,
      name: "index_product_options_with_value"
  end
end
