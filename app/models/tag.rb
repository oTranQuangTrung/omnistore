class Tag < ApplicationRecord
  has_many :product_tags, dependent: :destroy
  has_many :products, through: :product_tags

  belongs_to :shop

  validates :name, presence: true, uniqueness: {scope: :shop_id}
end
