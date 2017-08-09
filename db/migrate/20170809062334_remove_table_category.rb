class RemoveTableCategory < ActiveRecord::Migration[5.1]
  def up
    remove_reference :products, :category, foreign_key: true
    remove_reference :categories, :shop, foreign_key: true
    drop_table :categories
  end

  def down
    create_table :categories do |t|
      t.references :shop, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
    add_reference :products, :category, foreign_key: true
  end
end
