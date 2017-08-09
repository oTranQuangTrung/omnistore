class Collection < ApplicationRecord
  mount_uploader :featured_image, ImageUploader

  belongs_to :shop

  validates :name, presence: true, uniqueness: true, length: {maximum: 200}

  scope :lastest, -> {order(created_at: :desc)}
end
