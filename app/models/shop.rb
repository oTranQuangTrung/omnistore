class Shop < ApplicationRecord
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  has_many :collections, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :vendors, dependent: :destroy

  belongs_to :facebook_page, optional: true

  validates :name, presence: true
end
