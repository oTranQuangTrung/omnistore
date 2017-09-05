class CollectionProduct < ApplicationRecord
  belongs_to :collection
  belongs_to :product

  validates :product_id, :collection_id, presence: true
  validates :product_id, uniqueness: {scope: :collection_id}
end
