class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :option

  validates :value, presence: true, uniqueness: {scope: [:product_id, :option_id]}
end
