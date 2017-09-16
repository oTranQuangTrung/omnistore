class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.references :shop, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :vendors, [:shop_id, :name], unique: true
  end
end
