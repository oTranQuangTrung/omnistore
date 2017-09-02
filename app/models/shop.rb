class Shop < ApplicationRecord
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  has_many :collections, dependent: :destroy

  validates :name, presence: true

  def connect_to_facebook_page facebook_page
    Shop::ConnectToFacebookPage.call self, facebook_page
  end

  def disconnect_facebook_page facebook_page
    Shop::DisconnectFacebookPage.call self, facebook_page
  end
end
