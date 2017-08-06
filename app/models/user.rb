class User < ApplicationRecord
  has_many :user_shops, dependent: :destroy
  has_many :shops, through: :user_shops
end
