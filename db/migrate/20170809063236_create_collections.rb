class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.references :shop, foreign_key: true
      t.string :name
      t.text :description
      t.string :featured_image
      t.boolean :public, default: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
