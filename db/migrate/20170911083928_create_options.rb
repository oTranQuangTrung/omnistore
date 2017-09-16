class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :shop, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :options, [:shop_id, :name], unique: true
  end
end
