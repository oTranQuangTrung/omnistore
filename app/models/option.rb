class Option < ApplicationRecord
  belongs_to :shop

  has_many :product_options, dependent: :destroy
  has_many :products, through: :product_options

  validates :name, presence: true, uniqueness: {scope: :shop_id}
end
