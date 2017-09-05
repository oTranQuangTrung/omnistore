class CreateCollectionProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :collection_products do |t|
      t.references :product, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end

    add_index :collection_products, [:product_id, :collection_id], unique: true
  end
end
