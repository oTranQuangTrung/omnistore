class Variant < ApplicationRecord
  belongs_to :product

  validates :name, presence: true, uniqueness: {scope: :product_id}
  validates :price, :quantity, numericality: {greater_than_or_equal_to: 0}
end
