class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :category, optional: true
  belongs_to :vendor, optional: true

  has_many :collection_products, dependent: :destroy
  has_many :product_options, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :variants, dependent: :destroy
  has_many :collections, through: :collection_products
  has_many :options, through: :product_options
  has_many :tags, through: :product_tags

  enum visibility: [:publish, :unpublished]
  enum inventory: [:in_stock, :out_of_stock]

  validates :name, :shop_id, presence: true
  validates :price, :quantity, :weight, numericality: {greater_than_or_equal_to: 0}
end
