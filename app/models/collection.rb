class Collection < ApplicationRecord
  mount_uploader :featured_image, ImageUploader

  belongs_to :shop

  has_many :collection_products, dependent: :destroy
  has_many :products, through: :collection_products

  validates :name, presence: true, uniqueness: {scope: :shop_id}, length: {maximum: 200}

  scope :lastest, -> {order(created_at: :desc)}
end
