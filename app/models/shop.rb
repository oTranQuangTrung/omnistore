class Shop < ApplicationRecord
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  has_many :collections, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :vendors, dependent: :destroy

  validates :name, presence: true

  def connect_to_facebook_page facebook_page
    Shop::ConnectToFacebookPage.call self, facebook_page
  end

  def disconnect_facebook_page facebook_page
    Shop::DisconnectFacebookPage.call self, facebook_page
  end
end
