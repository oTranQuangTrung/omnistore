class Vendor < ApplicationRecord
  belongs_to :shop

  has_many :products

  validates :name, presence: true, uniqueness: {scope: :shop_id}
end
