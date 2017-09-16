class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :shop, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :tags, [:shop_id, :name], unique: true
  end
end
