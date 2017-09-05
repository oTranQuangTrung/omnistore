class Category < ApplicationRecord
  has_many :products

  belongs_to :shop

  validates :name, presence: true, uniqueness: {scope: :shop_id}
end
